import Foundation

struct LivingsResponse: Decodable {
    let items: [Living]
}

struct Living: Decodable, Identifiable {
    let id: String
    let dormitoryName: String
    let city: String
    let universityName: String
    let street: String
    let houseNumber: String
    let meal: String
    let minDays: Int
    let maxDays: Int
    let coordinates: [String]
    let photo: [String]
    let priceFrom: Int
    let priceTo: Int
    let contacts: Contacts
    let requiredUniDocs: String
    let requiredStudentDocs: String
    let services: [Service]
    let rooms: [Room]
    
    static var testArray: [Living] {
        var result = [Living]()
        for i in 0..<3 {
            result.append(
                .init(
                    id: i.description,
                    dormitoryName: "Студенческое общежитие ПВГУС",
                    city: "Тольятти",
                    universityName: "ФГБОУ ВО «Поволжский государственный университет сервиса»",
                    street: "",
                    houseNumber: "",
                    meal: "",
                    minDays: 0,
                    maxDays: 0,
                    coordinates: [],
                    photo: [],
                    priceFrom: 100,
                    priceTo: 300,
                    contacts: .init(name: "", email: "", phoneNumber: ""),
                    requiredUniDocs: "",
                    requiredStudentDocs: "",
                    services: [],
                    rooms: []
                )
            )
        }
        
        return result
    }
}

struct Service: Decodable {
    let name: String
    let description: String
    let price: String
}


struct Room: Decodable {
    let type: String
    let amount: String
    let price: String
    let description: String
    let photos: [String]
}

struct Contacts: Decodable {
    let name: String
    let email: String
    let phoneNumber: String
}


struct LivingDeprecated: Hashable {
    let image: String
    let title: String
    let place: String
    let placeUrl: URL?
    let subject: String
    let city: String
    let food: String
    let address: String
    let variantsCount: Int
    let costFrom: Int
    let costTo: Int?
    let durationFrom: Int
    let durationTo: Int
    
    static var testArray: [LivingDeprecated] = .init(
        repeating: LivingDeprecated(
        image: "person",
        title: "Студенческое общежитие ПВГУС",
        place: "ФГБОУ ВО «Поволжский государственный университет сервиса»",
        placeUrl: URL(string: "https://www.tolgas.ru/"),
        subject: "Самарская область",
        city: "Тольятти",
        food: "Без питания",
        address: "ул. Ленинградская, 29",
        variantsCount: 1,
        costFrom: 30,
        costTo: nil,
        durationFrom: 2,
        durationTo: 30
    ),
        count: 3
    )
}
