import Combine
import Alamofire
import Foundation

class Client {
    let appID = 8125315
    lazy var session: Session = {
        return Session(interceptor: RequestInterceptor(token: authToken))
    }()
    
    let address = "https://159b-91-142-83-218.eu.ngrok.io"
    
    private static let tokenKey = "VK_AUTH_TOKEN"
    
    let isAuthorizedPublisher: CurrentValueSubject<Bool, Never>
    
    init() {
        isAuthorizedPublisher = .init(Client.isAuthorized)
    }
    
    var authToken: String? {
        get {
            UserDefaults.standard.string(forKey: Self.tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.tokenKey)
            session = Session(interceptor: RequestInterceptor(token: newValue))
            isAuthorizedPublisher.send(authToken != nil)
        }
    }
    
    static var isAuthorized: Bool {
        UserDefaults.standard.string(forKey: Self.tokenKey) != nil
    }
}

final class RequestInterceptor: Alamofire.RequestInterceptor {
    private let token: String?
    
    init(token: String?) {
        self.token = token
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest

        if let token = token {
            urlRequest.setValue(token, forHTTPHeaderField: "access-token")
        }

        completion(.success(urlRequest))
    }
}

