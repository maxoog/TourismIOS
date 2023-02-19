import Foundation

struct EventsResponse: Decodable {
    let items: [Event]
}

struct Event: Identifiable, Decodable, Equatable {
    let id: String
    let type: String
    let name: String
    let timeRange: String
    let price: String
    let description: String
    let region: String
    let photos: [String]
    let universityName: String
    let hasVolunteering: Bool
    
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
                universityName: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет",
                hasVolunteering: true
            )
            )
        }
        
        return result
    }
    static let bookingArray: [Event] = [
        Event(
            id: "1",
            type: "Научно-популярные",
            name: "Презентация научных достижений Самарского университета",
            timeRange: "31.07.2022 - 30.11.2023",
            price: "0",
            description: "В выставочном зале представлены научно-технические разработки Самарского университета, где можно ознакомиться с достижениями ракетно-космической, металлургической, химической, энергетической, авиационной, и других областей.",
            region: "Самарская область",
            photos: [
                "https://stud-files.sabir.pro/files/pdz3elxKAE-52f209d69972050689b766986a9b5e9b15b168ba588d2804fd0427097616247f.jpg",
                "https://stud-files.sabir.pro/files/pdz3elxKAE-ef184a84c91e5be4a50a9a1d8508a894fb1c65a86291dc485ebfe2211641d293.jpg",
                "https://stud-files.sabir.pro/files/pdz3elxKAE-b14bb66fa52e17745b7559ff090e2383b1c7f5b9ae10a93e4f98665cd544fd40.jpg"
            ],
            universityName: "ФГАОУ ВО Самарский национальный исследовательский университет имени академика С.П. Королева",
            hasVolunteering: false
        ),
        Event(
            id: "2",
            type: "Научно-популярные",
            name: "VIII Тверская Международная Модель ООН",
            timeRange: "19.03.2023 - 23.03.2023",
            price: "0",
            description: "Модель ООН – студенческая ролевая игра, в ходе которой в течение нескольких дней студенты воспроизводят работу органов Организации Объединенных Наций. Каждый участник, представляя выбранную страну, защищает её интересы, выдвигает проекты решения международных проблем. Результатом работы является резолюция – итоговый документ, в котором отражена позиция имитируемого мирового сообщества по теме повестки дня.",
            region: "Тверская область",
            photos: [
                "https://stud-files.sabir.pro/files/hHsRxz5H7U-92de5c414dff331d9065b810c4f26486fc65501e12c1c059dde009ecf9571692.jpg",
                "https://stud-files.sabir.pro/files/hHsRxz5H7U-abe80c00306f815b1ceae537f65fca7cc4c17afc2592036ba73fe5ec3fd2f57b.jpg",
                "https://stud-files.sabir.pro/files/hHsRxz5H7U-87d916c87d4194dc3d51169a9fb5ee9442f9537749f0bb82562af9f9f4781211.jpg",
                "https://stud-files.sabir.pro/files/hHsRxz5H7U-212ef04468e90045491514649cebc75e243e5e965784af274541f0814dbe3304.jpg",
                "https://stud-files.sabir.pro/files/hHsRxz5H7U-1caa0c5965e7434d737d84cb60de608514eddc1131cf693132298bcd80629992.jpg"
            ],
            universityName: "ФГБОУ ВО «Тверской государственный университет»",
            hasVolunteering: false
        ),
        Event(
            id: "3",
            type: "Культурно-познавательные",
            name: "Программа \"В сердце Уссурийской тайги\"",
            timeRange: "20.08.2023 - 28.08.2023",
            price: "40000",
            
            description: "Мероприятие проводится при наличии группы не менее 10 человек. Программа включает множество экскурсионных программ по лесам Приморского края, заповедникам, местам обитания амурского тигра. Вы пройдете по экологической тропе Уссурийской тайги, совершите путешествие на побережье Японского моря, посетите объекты саммита АТЭС, один из крупнейших научно-познавательных комплексов мира – Приморский океанариум, а также совершите морскую экскурсию на катере по Амурскому заливу.",
            region: "Приморский край",
            photos: [
                "https://stud-files.sabir.pro/files/UqzgjWMApd-94b69fb8ed2d449f98071d6b622456cf591461b63b689b3bcf0cc3cad7478a5d.jpg",
                "https://stud-files.sabir.pro/files/UqzgjWMApd-934edea6dad0997a03b390524927915b08e037ba34688ba2f13b717944912dc4.jpg",
                "https://stud-files.sabir.pro/files/UqzgjWMApd-9adde5053bf808c95e69f06e0db214b3bb2472daa82f163b8bdbb5031c01ca06.jpg",
                "https://stud-files.sabir.pro/files/UqzgjWMApd-097dd4c9b57ee105de31b05792a802b1e0da952e4dd0e90d1facc8e3177f72ea.jpg",
                "https://stud-files.sabir.pro/files/UqzgjWMApd-25790bcc5dfc4ab51971a7596fc98fe38506d51703996ca0b2da5f23480bbbee.jpg"
            ],
            universityName: "ФГБОУ ВО «Приморская государственная сельскохозяйственная академия»",
            hasVolunteering: false
        )
    ]
    
    static let bookingStatusArray: [BookStatus] = [
        .approved,
        .review,
        .rejected
    ]
    
    static let searchArray: [Event] = [
        .init(
            id: "1",
            type: "Культурно-познавательные",
            name: "Путешествие по Карелии",
            timeRange: "02.02.2023 - 03.03.2023",
            price: "3000-4000",
            description: "Посещение Центра боевой славы и Мелекесского гарнизона по предварительной договоренности",
            region: "Ленинградская Область",
            photos: ["https://tvtogliatti24.ru/userfiles/news/big/tur_1656963011.jpg"],
            universityName: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет",
            hasVolunteering: false
        ),
        .init(
            id: "0",
            type: "Культурно-познавательные",
            name: "Полуфинал ICPC в Санкт-Петербурге",
            timeRange: "28.02.2023 - 02.02.2023",
            price: "0",
            description: "Посещение Центра боевой славы и Мелекесского гарнизона по предварительной договоренности",
            region: "Санкт-Петербург",
            photos: ["https://cdnn21.img.ria.ru/images/151939/86/1519398674_0:54:1024:630_1920x0_80_0_0_1aceea71d7439693ff5f313590eff344.jpg"],
            universityName: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет",
            hasVolunteering: true
        ),
        .init(
            id: "2",
            type: "Культурно-познавательные",
            name: "Летний лагерь в Крыму!",
            timeRange: "02.06.2023 - 20.06.2023",
            price: "11000",
            description: "Посещение Центра боевой славы и Мелекесского гарнизона по предварительной договоренности",
            region: "Симферополь",
            photos: ["https://pobedarf.ru/wp-content/uploads/2021/07/5d09cb4b09213.jpg"],
            universityName: "Поволжский казачий институт управления и пищевых технологий (филиал) ФГБОУ ВО МГУТУ им. К.Г. Разумовского (Первый казачий университет",
            hasVolunteering: true
        ),
    ]
}
