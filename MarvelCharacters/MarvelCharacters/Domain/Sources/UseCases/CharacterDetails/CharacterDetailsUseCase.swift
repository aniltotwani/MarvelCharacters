import Foundation

struct CharacterDetailsParams {
    typealias Completion = (_ result: Result<CharacterDetailsModel, UseCaseError>) -> Void

    let characterID: Int
    let completion: Completion

    init(characterID: Int,
         completion: @escaping Completion) {
        self.characterID = characterID
        self.completion = completion
    }
}

protocol CharacterDetailsUseCaseContract {
    func run(_ params: CharacterDetailsParams)
}

final class CharacterDetailsUseCase: CharacterDetailsUseCaseContract {
    private let provider: CharacterServiceProviderContract

    init(provider: CharacterServiceProviderContract = CharacterServiceProvider()) {
        self.provider = provider
    }

    func run(_ params: CharacterDetailsParams) {
        provider.getCharacterDetails(characterID: params.characterID, completion: params.completion)
    }
}
