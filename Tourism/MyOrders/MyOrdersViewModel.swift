import Foundation

import SwiftUI
class MyOrdersViewModel: ObservableObject {
    let booksService: BookService
    
    init(booksService: BookService) {
        self.booksService = booksService
    }
    
    @Published var events: [Event] = Event.testArray
    @Published var livings: [Living] = Living.testArray
    
    func refresh() { // обновить всю страницу с бронями
        booksService.getBooks { books in
            print(books)
            self.livings = books.dormitories
            self.events = books.events
        }
    }
    
}
