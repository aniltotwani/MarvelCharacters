import Foundation

@testable import MarvelCharacters

extension CharacterDetailsModel {
    static func dummyInstance() -> CharacterDetailsModel {
        CharacterDetailsModel(id: 1111,
                              name: "character name",
                              description: "character description",
                              thumbnail: URL(string: "www.image.com"))
    }
}
