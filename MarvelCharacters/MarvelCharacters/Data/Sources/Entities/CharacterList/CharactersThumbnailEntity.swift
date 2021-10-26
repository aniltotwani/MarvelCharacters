import Foundation

struct CharactersThumbnailEntity: Codable {
    let path: String?
    let imageExtension: String?

    private enum CodingKeys : String, CodingKey {
        case path
        case imageExtension = "extension"
    }

    func mapToDomain() -> URL? {
        let imageURL = [path ?? "", imageExtension ?? ""].joined(separator: ".")
        return URL(string: imageURL)
    }
}
