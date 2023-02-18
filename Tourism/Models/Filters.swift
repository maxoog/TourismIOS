import Foundation


struct Filters: Codable {
    let accommodationType: String // количество комнат
    let region: String
    let district: String
    let city: String
    let meal: String
}
