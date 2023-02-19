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
    let previewPhoto: String
    let backgroundPhoto: String
    
    static var testArray: [News] {
        return [
            News(
                title: "Путешествия бесплатно!",
                description: "В течение 3 месяцев оплачивайте ваши бронирования при помощи пушкинской карты",
                photo: "https://stud-files.sabir.pro/files/AyPBoRskMF-956db64969907d170b52816da62c67c2f93ad7da20000d75773dba1cf24ce85f.png",
                url: "https://студтуризм.рф/news/w81OeDIGBu",
                color: .red,
                previewPhoto: "zeroPreview",
                backgroundPhoto: "pushkinCard"
            ),
            
            News(
                title: "Вся Москва за 2 дня!",
                description: "Бывалые путешественники расскажут, как за неделю объехать все достопримечательности столицы, не потратив при этом состояние",
                photo: "https://stud-files.sabir.pro/files/dNCqcVG23q-48f6a56210c20608d03297611c6e2091f44570e6e76e5e167acb8d0ae9577b33.jpeg",
                url: "https://студтуризм.рф/news/w81OeDIGBu",
                color: .red,
                previewPhoto: "moscow",
                backgroundPhoto: "moscow2"
            ),
            News(
                title: "Встречайте Омск!",
                description: "Город в Сибири, который может похвастаться статусом самого зелёного города в России. Что скрывает этот белокаменный кремль?",
                photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpuppetmo.ru%2Fnews%2Fpushkinskaja-karta%2F&psig=AOvVaw1PLoBE-5qGjSkjq0YWzdPK&ust=1676754104226000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLiflvi5nf0CFQAAAAAdAAAAABAJ",
                url: "ya.ru",
                color: .red,
                previewPhoto: "omsk",
                backgroundPhoto: "omsk"
            ),
            News(
                title: "Отдых в глубинке",
                description: "Рассказываем, как отлично провести зимние каникулы, не потратив при этом состояние. Вологда, Рязань - города, который каждый должен посетить.",
                photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgb.ru%2Fposts%2Fdo_a_hackaton&psig=AOvVaw22jOzVywY54rzIedgoBYXb&ust=1676754600940000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPCR9uS7nf0CFQAAAAAdAAAAABAM",
                url: "ya.ru",
                color: .red,
                previewPhoto: "fourthPreview",
                backgroundPhoto: "fourthPreview"
            )
//            News(
//                title: "Лекция на пляже",
//                description: "Росмолодёжь составила топ-10 вузов на берегу моря, чтобы вы могли загорать, пока учитесь, и учиться, пока загораете",
//                photo: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.advantour.com%2Frus%2Frussia%2Fsochi.htm&psig=AOvVaw24BsGAoj7HxkV7RUxTTXyG&ust=1676755598416000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCICz0MC_nf0CFQAAAAAdAAAAABAE",
//                url: "ya.ru",
//                color: .red,
//                previewPhoto: "https://stud-files.sabir.pro/files/AyPBoRskMF-956db64969907d170b52816da62c67c2f93ad7da20000d75773dba1cf24ce85f.png"
//            )
        ]
    }
}
