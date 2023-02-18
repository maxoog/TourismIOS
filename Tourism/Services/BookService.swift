import Foundation
import Alamofire

struct Books: Decodable {
    let dormitories: [Living]
    let events: [Event]
}

class BookService {
    let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getBooks(completion: @escaping (Books) -> Void) {
        let request = client.session.request("\(client.address)/booking/my")
        
        request.responseDecodable(of: Books.self) { response in
            switch response.result {
            case let .success(books):
                completion(books)
            case let .failure(error):
                assertionFailure("livings parse error")
                print(error)
            }
        }
    }
    
    func removeLiving(id: String) {
        let request = client.session.request(
            "https://api/some_url",
            method: .delete,
            parameters: ["id": id]
        )
        
        request.response { response in
            // do what?
        }
    }
    
    func removeEvent(id: String) {
        let request = client.session.request(
            "https://api/some_url",
            method: .delete,
            parameters: ["id": id]
        )
        
        request.response { response in
            // do what?
        }
    }
}
