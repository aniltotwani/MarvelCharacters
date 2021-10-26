import UIKit

typealias State = Equatable

class BaseViewController: UIViewController, ViewConstructor {
    private let activityLoader = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoaderView()
    }

    open class var storyboardName: String {
        assertionFailure("Storyboard Name")
        return ""
    }

    func setupLoaderView() {
        activityLoader.setupLoaderView(parentView: self.view)
    }

    func showActivityLoader() {
        activityLoader.showActivityLoader()
    }
    
    func removeActivityLoader() {
        activityLoader.removeActivityLoader()
    }
}
