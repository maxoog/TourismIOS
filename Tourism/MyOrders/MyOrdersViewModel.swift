import Foundation

import SwiftUI
class MyOrdersViewModel: ObservableObject {
    let booksService: BookService
    
    @Published var events: [Event] = Event.testArray
    @Published var livings: [Living] = Living.testArray
    @Published var bookingEvents: [Event] = Event.bookingArray
    @Published var bookingLivings: [Living] = Living.bookingArray
    @Published var activeSection: MainViewModel.ListType = .eventSection
    @Published var showedLiving: Living?
    @Published var showedEvent: Event?
    
    init(booksService: BookService) {
        self.booksService = booksService
    }

    
    func refresh() { // обновить всю страницу с бронями
        booksService.getBooks { books in
            print(books)
            self.livings = books.dormitories
            self.events = books.events
        }
        withAnimation {
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
