import Foundation
import Combine

class StoryTimer: ObservableObject {
    @Published var progress: Double
    
    private var interval: TimeInterval
    private let publisher: Timer.TimerPublisher

    var cancellable: Cancellable?
    let itemsCount: Int
    
    var dismiss: (() -> Void)?
    
    init(items: Int, interval: TimeInterval) {
        self.itemsCount = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.01, on: .main, in: .default)
    }
    
    func start() {
        self.cancellable = publisher.autoconnect().sink(receiveValue: { _ in
            var newProgress = self.progress + (0.01 / self.interval)
            // handle last story
            if Int(newProgress) >= self.itemsCount {
                (self.dismiss ?? {})()
                newProgress = 0
            }
            
            self.progress = newProgress
        })
    }
    
    func nextStory() {
        var newProgress = Int(progress) + 1
        // handle last story
        if Int(newProgress) >= itemsCount {
            newProgress = 0
            (dismiss ?? {})()
        }
        
        progress = Double(newProgress)
    }
    
    func previousStory() {
        var newProgress = Int(progress)
        
        if (progress - Double(newProgress)) / Double(interval) < 0.2 {
            newProgress -= 1
        }
        
        progress = Double(newProgress)
    }
}
