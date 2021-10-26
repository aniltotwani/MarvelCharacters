import Alamofire
import Foundation
import JSONDecoder_Keypath

extension CharacterServiceProvider {
    func getCharacterList(for data: Data) -> Result<CharacterListModel, UseCaseError> {
        do {
            let responseEntity = try JSONDecoder().decode(CharacterListEntity.self, from: data, keyPath: "data")
            let model = try responseEntity.mapToDomain()
            return .success(model)
        } catch {
            return .failure(.generic(error))
        }
    }

    func getCharacterDetails(for data: Data) -> Result<CharacterDetailsModel, UseCaseError> {
        do {
            let characterDetailsEntity = try JSONDecoder().decode([CharacterDetailsEntity].self, from: data, keyPath: "data.results")
            guard let characterDetailsModel = try characterDetailsEntity.first?.mapToDomain() else {
                return .failure(.inValidURL)
            }
            return .success(characterDetailsModel)
        } catch {
            return .failure(.generic(error))
        }

    }
}
