import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    enum ListType: String, CaseIterable {
        case eventSection = "События"
        case livingSection = "Размещения"
    }
    
    private let navigationController = NavigationController.shared
    @Published var news: [News] = News.testArray
    @Published var activeSection: ListType = .eventSection
    @Published var events = Event.searchArray
    @Published var livings = Living.testArray
    
    @Published var volounteerFilter: Bool = false {
        didSet {
            if volounteerFilter {
                events = Event.searchArray.filter { event in
                    event.hasVolunteering
                }
            } else {
                events = Event.searchArray
            }
        }
    }
    
    @Published var showedLiving: Living?
    @Published var showedEvent: Event?
    
    @Published var showStoriesFromIndex: Int?
    
    func showStories(index: Int) {
        withAnimation(.spring()) {
            self.showStoriesFromIndex = index
        }
    }
    
    func dismissStories() {
        withAnimation(.spring()) {
            self.showStoriesFromIndex = nil
        }
    }
    
    func eventTap(event: Event) {
        showedEvent = event
    }
    
    func livingTap(living: Living) {
        showedLiving = living
    }
    
    func dismissAllCards() {
        showedEvent = nil
        showedLiving = nil
    }
}

extension Int: Identifiable {
    public var id: Int {
        self
    }
}
