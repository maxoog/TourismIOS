import WebKit
import Combine

class VKAuthViewModel: ObservableObject {
    private var authService: AuthService
    private var cancellable: Cancellable?
    
    @Published var urlRequest: URLRequest?
    @Published var clearCookie: Bool
    
    let delegate: WKNavigationDelegate
    let onAuthorize: () -> Void
    
    init(authService: AuthService, onAuthorize: @escaping () -> Void) {
        self.authService = authService

        self.delegate = authService
        self.clearCookie = !authService.isAuthorized
        self.urlRequest = authService.getLoginRequest()
        self.onAuthorize = onAuthorize
        
        let cancellable = authService.isAuthorizedPublisher
            .receive(on: DispatchQueue.main)
            .sink { isAuth in
                if isAuth {
                    onAuthorize()
                }
            }
        self.cancellable = cancellable
    }
    
}
