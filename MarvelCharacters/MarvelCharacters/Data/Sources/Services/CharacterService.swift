import Foundation
import Moya

enum CharacterService {

    case characterList(entity: CharacterListRequestEntity)
    case characterDetails(characterID: Int)
}

extension CharacterService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/") else {
            fatalError("Not able to configure baseURL")
        }
        return url
    }

    var path: String {
        switch self {
        case .characterList:
            return "characters"
        case .characterDetails(let id):
            return "characters/\(id)"
        }
    }

    var mainURL: URL {
        baseURL.appendingPathComponent(path)
    }

    var method: Moya.Method {
        .get
    }

    var task: Task {
        switch self {
        case .characterList:
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)

        case .characterDetails:
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }

    var mockName: String? {
        let filePath = Bundle.main.path(forResource: "CharacterList", ofType: "json") ?? ""
        return filePath
    }

    var parameters: [String: Any] {
        var parameters = getRequiredParameters()
        switch self {
        case .characterList(let requestEntity):
            parameters["offset"] = requestEntity.offset
            parameters["limit"] = requestEntity.limit
            return parameters
        case .characterDetails:
            return parameters
        }
    }

    private func getRequiredParameters() -> [String: Any] {
        let ts = "1"
        guard let path = Bundle.main.path(forResource: "CharactersKey", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let charactersKeys = try? PropertyListDecoder().decode(CharactersKey.self, from: data) else {
                  return ["": ""]
              }
        let params = ["apikey": charactersKeys.apikey, "ts": ts, "hash": charactersKeys.hash]
        return params
    }
}
