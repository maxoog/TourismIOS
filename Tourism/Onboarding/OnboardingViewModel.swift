import SwiftUI

class OnboardingViewModel: ObservableObject {
    enum State: Identifiable {
        var id: Int {
            switch self {
            case .travel:
                return 0
            case .meet:
                return 1
            case .action:
                return 2
            }
        }
        
        case travel
        case meet
        case action
        
        mutating func next() {
            switch self {
            case .travel:
                self = .meet
            case .meet:
                self = .action
            case .action:
                self = .travel
            }
        }
    }
    
    @Published var state: State = .travel
    var dismiss: () -> Void
    
    init(dismiss: @escaping () -> Void) {
        self.dismiss = dismiss
    }
}
