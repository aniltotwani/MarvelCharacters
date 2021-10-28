import Foundation
import Moya

final class CharacterServiceProvider: CharacterServiceProviderContract {
    typealias CharacterServiceProvider = Moya.MoyaProvider
    let characterService: CharacterServiceProvider<CharacterService>

    init(characterService: CharacterServiceProvider<CharacterService> = CharacterServiceProvider<CharacterService>()) {
        self.characterService = characterService
    }

    func getCharacterList(requestModel: CharacterListRequestModel, completion: @escaping CharacterListCompletion) {
        let requestEntity = CharacterListRequestEntity(model: requestModel)
        characterService.request(CharacterService.characterList(entity: requestEntity)) { response in
            switch response {
            case let .success(data):
                completion(self.getCharacterList(for: data))
            case let .failure(error):
                completion(.failure(error.error()))
            }
        }
    }

    func getCharacterDetails(characterID: Int, completion: @escaping CharacterDetailsCompletion) {
        characterService.request(CharacterService.characterDetails(characterID: characterID)) { response in
            switch response {
            case let .success(data):
                completion(self.getCharacterDetails(for: data))
            case let .failure(error):
                completion(.failure(error.error()))
            }
        }
    }
}
