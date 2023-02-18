import SwiftUI

@main
struct TourismApp: App {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    private static let key = UUID().description
    
    @State private var isFirstLaunch: Bool = (UserDefaults.standard.value(forKey: Self.key) as? Bool) ?? true
    
    var body: some Scene {
        WindowGroup {
            Group {
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
                .overlay {
                    if isFirstLaunch {
                        GeometryReader { proxy in
                            screenFactory.onboardingScreen(size: proxy.size, dismiss: {
                                isFirstLaunch = false
                                UserDefaults.standard.set(false, forKey: Self.key)
                            })
                        }
                        .transition(.opacity.animation(.easeInOut(duration: 0.5)))
                    }
                }
                 
            }
        }
    }
}
