import Foundation

struct CharacterDetailsViewModel: Equatable {
    let name: String
    let descriptionText: String
    let thumbnailURL: URL?

    init(name: String,
         descriptionText: String,
         thumbnailURL: URL?) {
        self.name = name
        self.descriptionText = !descriptionText.isEmpty ? descriptionText : "character_details_description_nodata".localizedString()
        self.thumbnailURL = thumbnailURL
    }
}
