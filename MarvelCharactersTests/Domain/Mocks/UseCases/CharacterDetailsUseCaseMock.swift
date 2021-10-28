@testable import MarvelCharacters

final class CharacterDetailsUseCaseMock: CharacterDetailsUseCaseContract {
    var result: Result<CharacterDetailsModel, UseCaseError>?

    func run(_ params: CharacterDetailsParams) {
        guard let result = result else {
            fatalError("Mock response required")
        }
        params.completion(result)
    }
}
