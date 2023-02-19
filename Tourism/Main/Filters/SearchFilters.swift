import Foundation

enum SearchFilter: Identifiable {
    case region
    case volunteer
    case eventType
    case accommodation
    
    static var eventFilters: [SearchFilter] {
        return [
            .region,
            .volunteer,
            .eventType
        ]
    }
    
    static var livingFilters: [SearchFilter] {
        return [
            .region,
            .accommodation
        ]
    }
    
    var id: Int {
        switch self {
        case .region:
            return 0
        case .volunteer:
            return 1
        case .eventType:
            return 2
        case .accommodation:
            return 3
        }
    }
    
    var text: String {
        switch self {
        case .region:
            return "Регион"
        case .volunteer:
            return "Волонтерство"
        case .eventType:
            return "Тип События"
        case .accommodation:
            return "Тип Размещения"
        }
    }
}
