import Foundation
import WebKit
import Combine

class ProfileViewModel: ObservableObject {
    private let authService: AuthService
    private let profileService: ProfileService
    private var cancellable: Cancellable?

    @Published var showAuthView: Bool = false
    @Published var userProfile: Profile?
    
    @Published var userAchivements: [Achivement] = Array(repeating:
        Achivement(
            title: "Фантастические места",
            description: "Посетите главные природные достопримечательности России",
            icon: "achivementIcon",
            current: 4,
            avaliable: 10,
            reward: 240
        ), count: 3)
    
    init(authService: AuthService, profileService: ProfileService) {
        self.authService = authService
        self.profileService = profileService
//        NavigationController.shared.hidden = true
        
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
