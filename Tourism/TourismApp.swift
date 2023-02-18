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
                            } else if navigationController.activeTab == .booking {
                                screenFactory.myOrdersScreen()
                            } else {
                                screenFactory.profileScreen()
                            }
                        }
                        CustomNavigationView()
                    }
                } else {
                    screenFactory.onboardingScreen()
                }
            }
        }
    }
}
