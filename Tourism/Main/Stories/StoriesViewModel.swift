import Foundation

class StoriesViewModel: ObservableObject {
//    @Published var showStories: Bool = false
    let news: [News]?
    let timer: StoryTimer
    
    
    init(news: [News]? = nil) {
        self.news = news
        
        if let news = news {
            timer = .init(items: news.count, interval: 6)
        } else {
            self.timer = .init(items: 3, interval: 6)
        }
    }
}
