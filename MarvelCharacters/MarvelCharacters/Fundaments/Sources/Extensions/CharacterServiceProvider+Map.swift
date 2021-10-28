import Foundation
import Moya

extension CharacterServiceProvider {
    func getCharacterList(for data: Response) -> Result<CharacterListModel, UseCaseError> {
        do {
            let responseEntity = try data.map(CharacterListEntity.self, atKeyPath: "data")
            let model = try responseEntity.mapToDomain()
            return .success(model)
        } catch {
            return .failure(.generic(error))
        }
    }

    func getCharacterDetails(for data: Response) -> Result<CharacterDetailsModel, UseCaseError> {
        do {
            let characterDetailsEntity = try data.map([CharacterDetailsEntity].self, atKeyPath: "data.results")
            guard let characterDetailsModel = try characterDetailsEntity.first?.mapToDomain() else {
                return .failure(.inValidURL)
            }
            return .success(characterDetailsModel)
        } catch {
            return .failure(.generic(error))
        }

    }
}
