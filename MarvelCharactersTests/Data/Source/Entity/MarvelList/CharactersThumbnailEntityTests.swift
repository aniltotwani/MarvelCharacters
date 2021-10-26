import XCTest

@testable import MarvelCharacters

class CharactersThumbnailEntityTests: XCTestCase {

    func testCharactersThumbnailEntityToDomain() {
        let entity = CharactersThumbnailEntity(path: "image", imageExtension: "jpg")
        let expectedURL = URL(string: "image.jpg")
        XCTAssertEqual(entity.mapToDomain(), expectedURL)
    }
}
