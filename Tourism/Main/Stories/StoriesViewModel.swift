import Foundation

class StoriesViewModel: ObservableObject {
    let news: [News]
    var timer: StoryTimer
    
    init(news: [News]) {
        self.news = news
        timer = .init(items: news.count, interval: 5)
    }
}
