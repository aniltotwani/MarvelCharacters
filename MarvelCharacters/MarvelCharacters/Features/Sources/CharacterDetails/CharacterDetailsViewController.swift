import UIKit

protocol CharacterDetailsViewContract: AnyObject {
    var presenter: CharacterDetailsPresenterContract! { get set }

    func changeViewState(_ state: CharacterDetailsViewState)
}

final class CharacterDetailsViewController: BaseViewController {
    var presenter: CharacterDetailsPresenterContract!
    @IBOutlet private weak var imageViewCharacter: UIImageView!
    @IBOutlet private weak var nameLabelCharacter: UILabel!
    @IBOutlet private weak var descriptionLabelCharacter: UILabel!

    override static var storyboardName: String {
        "CharacterDetailsViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewContract {
    func changeViewState(_ state: CharacterDetailsViewState) {
        switch state {
        case .clear:
            break
        case .loading:
            showActivityLoader()
        case .render(let characterDetailsViewModel):
            removeActivityLoader()
            setupView(characterDetailsViewModel)
        case .showError:
            removeActivityLoader()
            showError()
        }
    }
}

private extension CharacterDetailsViewController {
    func setupView(_ characterDetailsViewModel: CharacterDetailsViewModel) {
        nameLabelCharacter.text = characterDetailsViewModel.name
        descriptionLabelCharacter.text = characterDetailsViewModel.descriptionText
        renderImage(characterDetailsViewModel)

    }

    func renderImage(_ characterDetailsViewModel: CharacterDetailsViewModel) {
        imageViewCharacter.kf.indicatorType = .activity
        imageViewCharacter.kf.setImage(with: characterDetailsViewModel.thumbnailURL,
                                       placeholder: UIImage(),
                                       options: nil,
                                       completionHandler: nil)
    }

    func showError() {
        descriptionLabelCharacter.text = "character_details_description_error".localizedString()
    }
}
