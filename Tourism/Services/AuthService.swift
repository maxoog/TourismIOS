import WebKit
import Combine
import Alamofire

class AuthService: NSObject {
    private let client: Client
    
    var isAuthorized: Bool {
        return Client.isAuthorized
    }
    
    lazy var isAuthorizedPublisher: AnyPublisher = {
        return client.isAuthorizedPublisher.eraseToAnyPublisher()
    }()
    
    
    init(client: Client) {
        self.client = client
    }
    
    func getLoginRequest() -> URLRequest? {
        var components = URLComponents(string: "https://oauth.vk.com/authorize")
        components?.queryItems = [
            URLQueryItem(name: "client_id", value: "\(client.appID)"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "response_type", value: "token")
        ]
        guard let url = components?.url else {
            assertionFailure("login request url is wrong")
            return nil
        }

        print(url)

        return URLRequest(url: url)
    }
    
    func logout() {
        client.authToken = nil
    }
    
    func reportLogin(token: String) {
        let request = client.session.request(
            "\(client.address)/auth",
            method: .post,
            parameters: ["token": token],
            encoder: JSONParameterEncoder()
        )
        
        request
            .validate(statusCode: 200...300)
            .responseData { [weak self] response in
                guard let self = self else {
                    return
                }
                
                switch response.result {
                case .success:
                    self.client.authToken = token
                case .failure(let error):
                    self.client.authToken = token
                    print(error)
                }
            }
    }
}

extension AuthService: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if let token = parse(url: url) {
                reportLogin(token: token)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    
    // MARK - helpers
    
    private func parse(url: URL) -> String? {
        let str = url.description.replacingOccurrences(of: "#", with: "?")
        guard let items = URLComponents(string: str)?.queryItems else { return nil }
        guard let item = items.filter({$0.name == "access_token"}).first else { return nil }
        return item.value
    }
}
