import SwiftUI

@main
struct TourismApp: App {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    @State private var isFirstLaunch: Bool = UserDefaults.standard.bool(forKey: "first-launch")
    
    var body: some Scene {
        WindowGroup {
            Group {
                if true {
                    ZStack {
                        Group {
                            if navigationController.activeTab == .search {
                                screenFactory.mainScreen()
                                    .animation(.linear)
                                    .zIndex(1)
                            } else if navigationController.activeTab == .booking {
                                screenFactory.myOrdersScreen()
                                    .animation(.linear)
                                    .zIndex(2)
                            } else {
                                screenFactory.profileScreen()
                                    .zIndex(3)
                            }
                        }
                        
                        CustomNavigationView()
                            .zIndex(4)
                    }
                } else {
                    screenFactory.onboardingScreen()
                }
            }
        }
    }
}
