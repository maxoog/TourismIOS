import Foundation
import WebKit
import Combine

class ProfileViewModel: ObservableObject {
    private let authService: AuthService
    private let profileService: ProfileService
    private var cancellable: Cancellable?

    @Published var showAuthView: Bool = false
    @Published var userProfile: Profile?
    
    @Published var userAchivements: [Achivement] = [
        Achivement(current: 10, avaliable: 10),
        Achivement(current: 2, avaliable: 10),
        Achivement(current: 4, avaliable: 10),
        Achivement(current: 6, avaliable: 10),
        Achivement(current: 8, avaliable: 10),
    ]
    
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

struct Achivement: Hashable {
    let current: Int
    let avaliable: Int
}
