import Foundation
import UIKit

protocol Navigator {
    var childNavigators: [Navigator] { get set }
    var navigationController: UINavigationController { get set }

    func run() 
}
