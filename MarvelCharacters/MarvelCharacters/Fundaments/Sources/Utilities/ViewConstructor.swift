import UIKit

protocol ViewConstructor: AnyObject {
    associatedtype T

    static var storyboardName: String { get }
    static func constructViewController() -> T
}

extension ViewConstructor where Self: UIViewController {
    static func constructViewController() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardName) as? Self else {
            fatalError("Storyboard not found \(self.storyboardName)")
        }
        return viewController
    }
}


