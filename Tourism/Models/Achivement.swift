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
            icon: "achivementIcon",
            current: 1,
            avaliable: 10,
            reward: 200
        ),
        Achivement(
            title: "Фантастические места",
            description: "Посетите главные природные достопримечательности России",
            icon: "achivementIcon",
            current: 9,
            avaliable: 10,
            reward: 150
        )
    ]
}
