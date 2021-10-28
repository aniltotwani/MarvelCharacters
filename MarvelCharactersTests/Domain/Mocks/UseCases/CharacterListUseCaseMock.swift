@testable import MarvelCharacters

final class CharacterListUseCaseMock: CharacterListUseCaseContract {
    var result: Result<CharacterListModel, UseCaseError>?

    func run(_ params: CharacterListParams) {
        guard let result = result else {
            fatalError("Mock response required")
        }
        params.completion(result)
    }
}
