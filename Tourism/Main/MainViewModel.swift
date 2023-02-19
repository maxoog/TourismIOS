import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    private let navigationController = NavigationController.shared
    @Published var news: [News] = News.testArray
    @Published var activeSection: ListType = .eventSection
    @Published var events = Event.testArray
    @Published var livings = Living.testArray
    
    @Published var showedLiving: Living?
    @Published var showedEvent: Event?
    
    @Published var showStoriesFromIndex: Int?
    
    func showStories(index: Int) {
        withAnimation(.spring()) {
            self.showStoriesFromIndex = index
            NavigationController.shared.hidden = true
        }
    }
    
    func dismissStories() {
        withAnimation(.spring()) {
            self.showStoriesFromIndex = nil
            NavigationController.shared.hidden = false
        }
    }
    
    func eventTap(event: Event) {
        showedEvent = event
    }
    
    func livingTap(living: Living) {
        showedLiving = Living.bookingArray[0]
    }
    
    func dismissAllCards() {
        showedEvent = nil
        showedLiving = nil
    }
}

enum ListType: String, CaseIterable {
    case eventSection = "События"
    case livingSection = "Размещения"
}

extension Int: Identifiable {
    public var id: Int {
        self
    }
}
