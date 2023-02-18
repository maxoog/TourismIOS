import Foundation

struct NewsResponse: Decodable {
    let news: [News]
}

struct News: Decodable {
    let title: String
    let description: String
    let photo: String
    let url: String
    
    static var testArray: [News] {
        return Array.init(repeating: News(
            title: "Вся Москва за 2 дня!",
            description: "",
            photo: "В ночь на понедельник прошёл супербоул - громкое событие для поклонников американского футбола и крутой рекламы. Что показали автопроизводители?",
            url: "https://klike.net/uploads/posts/2019-07/1563795460_1.jpg"),
                          count: 6)
    }
}
