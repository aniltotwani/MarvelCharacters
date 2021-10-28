@testable import MarvelCharacters

final class CharacterServiceProviderMock: CharacterServiceProviderContract {
    var getCharacterList: Result<CharacterListModel, UseCaseError>?
    var getCharacterDetails: Result<CharacterDetailsModel, UseCaseError>?

    func getCharacterList(requestModel: CharacterListRequestModel, completion: @escaping CharacterListCompletion) {
        guard let result = getCharacterList else {
            fatalError("CharacterList Mock Error")
        }
        completion(result)
    }

    func getCharacterDetails(characterID: Int, completion: @escaping CharacterDetailsCompletion) {
        guard let result = getCharacterDetails else {
            fatalError("CharacterDetails Mock Error")
        }
        completion(result)
    }
}
