import Alamofire
import Foundation

enum UseCaseError: Error {
    case inValidURL
    case noResponse
    case generic(Error?)
}

extension AFError {
    func error() -> UseCaseError {
        switch self {
        case .invalidURL:
            return .inValidURL
        case .responseSerializationFailed, .responseValidationFailed:
            return .noResponse
        default:
            return .generic(self.underlyingError)
        }
    }
}
