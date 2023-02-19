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
    
    static var bookingArray: [Living] = [
        Living(
            id: "1",
            dormitoryName: "База отдыха ВСГИК \"ОСЛИК\" (Республика Бурятия, оз. Байкал)",
            city: "Республика Бурятия, Кабанский район",
            universityName: "ФГБОУ ВО Восточно-Сибирский государственный институт культуры",
            street: "Новый Энхалук",
            houseNumber: "1",
            meal: "Полный пансион",
            minDays: 3,
            maxDays: 15,
            coordinates: ["52.484056", "106.967431"],
            photo: [
                "https://stud-files.sabir.pro/files/oRKBZjbq6W-e2e2936c2cff008d399f15124ef1b0d9ac95967e3e4c931820429c78d71e2f94.jpg",
                "https://stud-files.sabir.pro/files/oRKBZjbq6W-442a194702fce196473a5c9963d1739e9dd77bdcf2017addacaa58c2950675f0.jpg",
                "https://stud-files.sabir.pro/files/oRKBZjbq6W-2f13e3e052634f68799083705974ae83e8339912216a164fabbb02a5c00ebf68.jpg",
                "https://stud-files.sabir.pro/files/oRKBZjbq6W-ef74f88fbd3d110d372fe369daa195b6e912b393127915e0b0679aad9eaac9fd.jpg",
                "https://stud-files.sabir.pro/files/oRKBZjbq6W-1861d3982724b322c6c2d3659093e8dc3fd348236a5f245a6be7f0e89766bd9a.jpg"
            ],
            priceFrom: 1600,
            priceTo: 3000,
            contacts: Contacts(name: "Нетребина Людмила Александровна", email: "info@vsgaki.ru", phoneNumber: "+79915413322"),
            requiredUniDocs: "Официальное письмо вуза, договор об оплате, список студентов",
            requiredStudentDocs: "Справка с места учебы, студенческий билет, паспорт, сертификат о вакцинации, квитанция об оплате",
            services: [
                Service(name: "Спортинвентарь", description: "Мячи, бильярд, стоимость за 1 час", price: "200"),
                Service(name: "Баня, душ", description: "Стоимость за 1 чел., 1 час", price: "200"),
                Service(name: "Проектор, экран", description: "Для проведения мероприятий в конференц зале, стоимость за 1 час", price: "36"),
            ],
            rooms: [
                Room(type: "2-х местный номер", amount: "1", price: "1600", description: "Размещение в коттеджах (2 и 4 местные номера), туалет благоустроенный (общий), 3 х разовое питание, баня", photos: [
                    "https://stud-files.sabir.pro/files/oRKBZjbq6W-3c9fb5898957987fcc3d73f54c4f0910597fb4860dba90a46f9833738703b5dc.jpg",
                    "https://stud-files.sabir.pro/files/oRKBZjbq6W-1861d3982724b322c6c2d3659093e8dc3fd348236a5f245a6be7f0e89766bd9a.jpg",
                    "https://stud-files.sabir.pro/files/oRKBZjbq6W-e1d06fc74f08883d69b256093f3726af59bd26c520682e03e0b89b8c55997fe3.jpg"
                ])
            ])
    ]
}

struct Service: Decodable, Hashable {
    let name: String
    let description: String
    let price: String
}


struct Room: Decodable, Hashable {
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
