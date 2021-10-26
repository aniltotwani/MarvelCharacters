import Foundation

extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, comment: "Localized String to desired language")
    }
}
