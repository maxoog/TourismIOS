import Foundation
import WebKit
import Combine

class ProfileViewModel: ObservableObject {
    private let authService: AuthService
    private let profileService: ProfileService
    private var cancellable: Cancellable?

    @Published var showAuthView: Bool = false
    @Published var userProfile: Profile?
    
    @Published var userAchivements: [Achivement] = Achivement.testArray
    
    init(authService: AuthService, profileService: ProfileService) {
        self.authService = authService
        self.profileService = profileService
        
        let cancellable = authService.isAuthorizedPublisher
            .receive(on: DispatchQueue.main)
            .sink { isAuth in
                if isAuth {
                    self.onAuthorize()
                }
            }
        self.cancellable = cancellable
    }
    
    func onAuthorize() {
        showAuthView = false
        profileService.getProfileData { profile in
            self.userProfile = profile
        }
        
        Analytics.reportEvent("Успешная авторизация", parameters: ["Пользователь": "text_maxood"])
    }
    
    func loginRequested() {
        showAuthView = true
    }
    
    func logoutRequested() {
        authService.logout()
        userProfile = nil
    }
}
