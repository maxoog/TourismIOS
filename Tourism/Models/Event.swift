import Foundation

struct EventsResponse: Decodable {
    let items: [Event]
}

struct Event: Identifiable, Decodable {
    let id: String
    let type: String
    let name: String
    let timeRange: String
    let price: String
    let description: String
    let region: String
    let photos: [String]
    let universityName: String
    
    static var testArray: [Event] {
        var result = [Event]()
        for i in 0..<3 {
            result.append(.init(
                id: i.description,
                type: "Культурно-познавательные",
                name: "Посещение Центра боевой славы и Мелекесского гарнизона",
                timeRange: "02.17.2023 - 02.17.2023",
                price: "0",
                description: "Посещение Центра боевой славы и Мелекесского гарнизона по предварительной договоренности",
                region: "Ульяновская область",
                photos: ["some_url"],
                universityName: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет")
            )
        }
        
        return result
    }
}

struct EventDeprecated: Hashable {
    let title: String
    let type: String
    let theme: String
    let place: String
    let placeUrl: URL?
    let subject: String
    let cost: String
    let dateFrom: Date
    let dateTo: Date
    let description: String
    
    static var testArray: [EventDeprecated] {
        return .init(
            repeating: EventDeprecated(
                title: "Посещение Центра боевой славы и Мелекесского гарнизона",
                type: "Культурно-познавательные", theme: "История",
                place: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет)",
                placeUrl: URL(string: "http://dimpku.ru/"),
                subject: "Ульяновская область",
                cost: "0",
                dateFrom: Date(),
                dateTo: Date(),
                description: "Посещение Центра боевой славы и Мелекесского гарнизона по предварительной договоренности"
            ),
            count: 3
        )
    }
}
