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
                name: "Полуфинал ICPC в Санкт-Петербурге",
                timeRange: "02.17.2023 - 02.17.2023",
                price: "0",
                description: "Посещение Центра боевой славы и Мелекесского гарнизона по предварительной договоренности",
                region: "Санкт-Петербург",
                photos: ["some_url"],
                universityName: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет")
            )
        }
        
        return result
    }
}
