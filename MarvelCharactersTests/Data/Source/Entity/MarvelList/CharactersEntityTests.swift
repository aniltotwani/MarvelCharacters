import XCTest

@testable import MarvelCharacters

class CharactersEntityTests: XCTestCase {

    func testCharactersEntityToDomain() {
        let entity = CharactersEntity(id: 1111,
                                      name: "Test",
                                      thumbnail: CharactersThumbnailEntity(path: "www.image.com",
                                                                           imageExtension: "jpg"))
        guard let model = try? entity.mapToDomain() else {
            XCTFail("Domain Model Conversion Failed")
            return
        }
        XCTAssertEqual(model.id, 1111)
        XCTAssertEqual(model.name, "Test")
    }

    func testCharactersEntityIDNotValid() {
        let entity = CharactersEntity(id: nil,
                                      name: "Test",
                                      thumbnail: CharactersThumbnailEntity(path: "www.image.com",
                                                                           imageExtension: "jpg"))
        XCTAssertThrowsError(try entity.mapToDomain())
    }

    func testCharactersEntityNameNotValid() {
        let entity = CharactersEntity(id: 1111,
                                      name: nil,
                                      thumbnail: CharactersThumbnailEntity(path: "www.image.com",
                                                                           imageExtension: "jpg"))
        XCTAssertThrowsError(try entity.mapToDomain())
    }
}
