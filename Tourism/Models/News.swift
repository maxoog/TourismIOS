import Foundation
import SwiftUI

struct NewsResponse {
    let news: [News]
}

struct News {
    let title: String
    let description: String
    let photo: String
    let url: String
    let color: Color
    
    static var testArray: [News] {
        return [
            
            News(
                        title: "По обмену в горы",
                        description: "До июля 2023 оплачивай общежития и билеты на события по Пушкинской карте. Не упусти возможность!",
                        photo: "https://stud-files.sabir.pro/files/dNCqcVG23q-48f6a56210c20608d03297611c6e2091f44570e6e76e5e167acb8d0ae9577b33.jpeg",
                        url: "https://студтуризм.рф/news/w81OeDIGBu",
                        color: .red
                    ),
            News(
                        title: "Езжайте по Пушкинской",
                        description: "До июля 2023 оплачивай общежития и билеты на события по Пушкинской карте. Не упусти возможность!",
                        photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpuppetmo.ru%2Fnews%2Fpushkinskaja-karta%2F&psig=AOvVaw1PLoBE-5qGjSkjq0YWzdPK&ust=1676754104226000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLiflvi5nf0CFQAAAAAdAAAAABAJ",
                        url: "ya.ru",
                        color: .red
                    ),
            News(
                        title: "Молодёжный бит",
                        description: "Приложение, в котором вы смотрите эту историю, появилось в рамках хакатона Молодёжный бит. Сотни участников по всей России 48 часов работали над приложением, а победители ещё 4 месяца дорабатывали его в тесном сотрудничествем с Росмолодёжью. Читайте о том, как родилось приложение, которым сейчас пользуются сотни тысяч студентов по всей России",
                        photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgb.ru%2Fposts%2Fdo_a_hackaton&psig=AOvVaw22jOzVywY54rzIedgoBYXb&ust=1676754600940000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPCR9uS7nf0CFQAAAAAdAAAAABAM",
                        url: "ya.ru",
                        color: .red
                    ),
            News(
                        title: "Лекция на пляже",
                        description: "Росмолодёжь составила топ-10 вузов на берегу моря, чтобы вы могли загорать, пока учитесь, и учиться, пока загораете",
                        photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.advantour.com%2Frus%2Frussia%2Fsochi.htm&psig=AOvVaw24BsGAoj7HxkV7RUxTTXyG&ust=1676755598416000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCICz0MC_nf0CFQAAAAAdAAAAABAE",
                        url: "ya.ru",
                        color: .red
                    ),
            News(
                        title: "Встречайте: Омск",
                        description: "string",
                        photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Firecommend.ru%2Fcontent%2Frossiya-omskaya-oblast-g-omsk&psig=AOvVaw2qqr-xSETkmqRdWb4n6WeT&ust=1676754497173000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIi-0bO7nf0CFQAAAAAdAAAAABAE",
                        url: "ya.ru",
                        color: .red
                    )
        ]
    }
}
