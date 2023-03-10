import Foundation

struct Achivement: Hashable {
    let title: String
    let description: String
    let icon: String
    let current: Int
    let avaliable: Int
    let reward: Int
    
    public static let testArray: [Achivement] = [
        Achivement(
            title: "Фантастические места",
            description: "Посетите главные природные достопримечательности России",
            icon: "achivementIcon",
            current: 4,
            avaliable: 10,
            reward: 240
        ),
        Achivement(
            title: "В полёте",
            description: "Слетайте более, чем в 7 разных городов России",
            icon: "achivementIcon1",
            current: 4,
            avaliable: 7,
            reward: 200
        ),
        Achivement(
            title: "Прирожденный волонтер",
            description: "Поучаствуйте в организации 5 мероприятий",
            icon: "achivementIcon2",
            current: 4,
            avaliable: 5,
            reward: 150
        )
    ]
}
