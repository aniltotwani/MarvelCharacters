import XCTest

@testable import MarvelCharacters

final class CharacterDetailsEntityTests: XCTestCase {
    func testCharacterDetailsEntityToDomain() {
        let entity = CharacterDetailsEntity(id: 1111,
                                            name: "character",
                                            description: "details",
                                            thumbnail: CharactersThumbnailEntity(path: "character",
                                                                                 imageExtension: "jpg"))
        guard let model = try? entity.mapToDomain() else {
            XCTFail("Domain Model Conversion Failed")
            return
        }
        XCTAssertEqual(model.id, 1111)
        XCTAssertEqual(model.name, "character")
        XCTAssertEqual(model.description, "details")
    }

    func testCharacterDetailsEntityInvalidID() {
        let entity = CharacterDetailsEntity(id: nil,
                                            name: "character",
                                            description: "details",
                                            thumbnail: CharactersThumbnailEntity(path: "character",
                                                                                 imageExtension: "jpg"))
        XCTAssertThrowsError(try entity.mapToDomain())
    }

    func testCharacterDetailsEntityInvalidName() {
        let entity = CharacterDetailsEntity(id: 1111,
                                            name: nil,
                                            description: "details",
                                            thumbnail: CharactersThumbnailEntity(path: "character",
                                                                                 imageExtension: "jpg"))

        XCTAssertThrowsError(try entity.mapToDomain())
    }

    func testCharacterDetailsEntityInvalidDescription() {
        let entity = CharacterDetailsEntity(id: 1111,
                                            name: "character",
                                            description: nil,
                                            thumbnail: CharactersThumbnailEntity(path: "character",
                                                                                 imageExtension: "jpg"))
        XCTAssertThrowsError(try entity.mapToDomain())
    }
}
