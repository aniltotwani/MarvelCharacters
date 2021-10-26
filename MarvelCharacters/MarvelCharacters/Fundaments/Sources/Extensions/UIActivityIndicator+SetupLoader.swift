import UIKit

extension UIActivityIndicatorView {
    func setupLoaderView(parentView: UIView) {
        parentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor),
        ])
        self.isHidden = true
        self.color = .darkGray
        self.style = .large
        self.hidesWhenStopped = true
    }

    func showActivityLoader() {
        self.startAnimating()
        self.isHidden = false
    }

    func removeActivityLoader() {
        self.stopAnimating()
    }
}
