import Foundation

class NavigationController: ObservableObject {
    static var shared: NavigationController = NavigationController()
    
    @Published var activeTab: TabBarItem = .search
    @Published var hidden: Bool = false
    @Published var showTitle: Bool = true
    
    private let iconNames: [TabBarItem : String] = [
        .search : "searchIcon",
        .booking : "bookingIcon",
        .profile : "profileIcon"
    ]
    
    func getIconName(for item: TabBarItem) -> String {
        return iconNames[item] ?? ""
    }
}

enum TabBarItem: String, CaseIterable {
    case search = "Поиск"
    case booking = "Бронирование"
    case profile = "Профиль"
}
