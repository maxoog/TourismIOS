//
//  SearchService.swift
//  Tourism
//
//  Created by Данила Семисчастнов on 18.02.2023.
//

import Foundation
import Alamofire

struct PriceResponse: Decodable {
    let price: Int
}

class SearchService {
    let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getTrainPrice(for request: TrainRequest, completion: @escaping (Int) -> Void) {
        let request = client.session.request(
            "\(client.address)/rzd",
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder()
        )
        
        request.responseDecodable(of: PriceResponse.self) { response in
            switch response.result {
            case let .success(priceResponse):
                completion(priceResponse.price)
            case let .failure(error):
                assertionFailure("parse error")
                print(error)
            }
        }
    }
}

struct TrainRequest: Codable {
    let frm: String
    let to: String
    let date: String
}
