import SwiftUI
import YandexMobileMetrica

let screenFactory = ScreenFactory()

public typealias Analytics = YMMYandexMetrica

final class ScreenFactory {
    fileprivate let appFactory = AppFactory()
    
    func myOrdersScreen() -> MyOrdersView {
        return MyOrdersView(viewModel: appFactory.myOrdersViewModel())
    }
    
    func onboardingScreen(size: CGSize, dismiss: @escaping () -> Void) -> OnboardingView {
        return OnboardingView(viewModel: appFactory.onboardingViewModel(dismiss: dismiss), size: size)
    }
    
    func newsScreen(news: [News], firstNewsIndex: Int, dismiss: @escaping () -> Void) -> SingleStoryView {
        return SingleStoryView(viewModel: appFactory.newsViewModel(news: news), dismiss: dismiss)
    }
    
    func mainScreen() -> MainView {
        return MainView(viewModel: self.appFactory.mainViewModel())
    }
    
    func profileScreen() -> ProfileView {
        return ProfileView(viewModel: appFactory.profileViewModel())
    }
    
    func vkAuthView(onAuthorize: @escaping () -> Void) -> VKAuthView {
        return VKAuthView(viewModel: appFactory.vkAuthViewModel(onAuthorize: onAuthorize))
    }
    
    func eventFullScreen(event: Event, dismiss: @escaping () -> Void) -> FullScreenEventsView {
        return FullScreenEventsView(event: event, service: appFactory.searchService, dismiss: dismiss)
    }

}

fileprivate final class AppFactory {
    fileprivate let client = Client()

    fileprivate lazy var authService = {
        return AuthService(client: client)
    }()
    
    fileprivate lazy var profileService: ProfileService = {
        return ProfileService(client: client)
    }()
    
    fileprivate lazy var booksService: BookService = {
        return BookService(client: client)
    }()
    
    fileprivate lazy var searchService: SearchService = {
        return SearchService(client: client)
    }()
    
    init() {
        if let config = YMMYandexMetricaConfiguration(apiKey: "bb502f2f-1737-4dae-a5df-8f06e22263b7") {
            YMMYandexMetrica.activate(with: config)
            reportAppLaunch()
        } else {
            assertionFailure("Error while activating metrica")
        }
    }
    
    func onboardingViewModel(dismiss: @escaping () -> Void) -> OnboardingViewModel {
        return OnboardingViewModel(dismiss: dismiss)
    }
    
    func myOrdersViewModel() -> MyOrdersViewModel {
        return MyOrdersViewModel(booksService: booksService)
    }
    
    func mainViewModel() -> MainViewModel {
        return MainViewModel()
    }
    
    func profileViewModel() -> ProfileViewModel {
        return ProfileViewModel(authService: authService, profileService: profileService)
    }
    
    func vkAuthViewModel(onAuthorize: @escaping () -> Void) -> VKAuthViewModel {
        VKAuthViewModel(authService: authService, onAuthorize: onAuthorize)
    }
    
    func newsViewModel(news: [News]) -> StoriesViewModel {
        return .init(news: news)
    }

    private func reportAppLaunch() {
        YMMYandexMetrica.reportEvent(
            "Запуск приложения",
            parameters: ["Пользователь": "test_maxood"]) { error in
                assertionFailure("Cannot send event for app launch!")
            }
    }
}

