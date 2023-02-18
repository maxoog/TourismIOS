import Foundation
import Alamofire

struct UserProfile: Decodable {
    let id: Int
    let photo_400_orig: String
    let first_name: String
    let last_name: String
    let can_access_closed: Bool
    let is_closed: Bool
    let city: City
}

struct City: Decodable {
    let id: Int
    let title: String
}

struct UsersProfiliesResponse: Decodable {
    let response: [UserProfile]
}

class ProfileService {
    let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func getProfileData(completion: @escaping (Profile) -> Void) {
        let request = client.session.request(
            "https://api.vk.com/method/users.get",
            method: .post,
            parameters: [
                "access_token": client.authToken ?? "",
                "fields": "photo_400_orig, city",
                "v": "5.131"
            ],
            encoder: URLEncodedFormParameterEncoder(destination: .httpBody)
        )
        
        request.responseDecodable(of: UsersProfiliesResponse.self) { [weak self] response in
            guard let self = self else {
                return
            }
            switch response.result {
            case let .success(profileResponse):
                guard let profile = profileResponse.response.first else {
                    return
                }
                completion(self.mapProfile(profile))
            case let .failure(error):
                assertionFailure("profile data fetching error")
                print(error)
            }
        }
    }
    
    private func mapProfile(_ profile: UserProfile) -> Profile {
        
        return .init(
            photo: profile.photo_400_orig,
            firstName: profile.first_name,
            lastName: profile.last_name,
            patr: "",
            mail: "maxood@yandex.ru",
            city: profile.city.title,
            university: "ИТМО",
            levelName: "Крузинштерн",
            phone: "+7(933)-993-65-90",
            levelCapacity: 140,
            currentLevelPoints: 59,
            currentLevel: 8,
            goldRingsCount: 3754
        )
    }
}
