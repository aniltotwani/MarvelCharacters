import UIKit

protocol CharacterListViewContract: AnyObject {
    var presenter: CharacterListPresenterContract! { get set }
    func changeViewState(_ state: CharacterListViewState)
}

final class CharacterListViewController: BaseViewController {
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var characterListCollectionView: UICollectionView!
    var presenter: CharacterListPresenterContract!

    override static var storyboardName: String {
        "CharacterListViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "character_list_title".localizedString()
        characterListCollectionView.register(UINib(nibName: "CharacterListCell", bundle: nil), forCellWithReuseIdentifier: "CharacterListCell")
        presenter.viewLoaded()
    }

    private func showError() {
        errorLabel.isHidden = false
        errorLabel.text = "error_character_list".localizedString()
    }
}

extension CharacterListViewController: CharacterListViewContract {
    func changeViewState(_ state: CharacterListViewState) {
        switch state {
        case .clear:
            removeActivityLoader()
            break
        case .render:
            removeActivityLoader()
            errorLabel.isHidden = true
            characterListCollectionView.reloadData()
        case.loading:
            showActivityLoader()
        case .showError:
            removeActivityLoader()
            showError()
        }
    }
}

extension CharacterListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CharacterListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterListCell", for: indexPath) as? CharacterListCell else {
            return UICollectionViewCell()
        }
        cell.setup(model: presenter.viewModelAt(indexPath: indexPath))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width * 0.45, height: collectionView.frame.size.width * 0.45)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == presenter.numberOfItemsIn(section: indexPath.row) - 1 {
            presenter.didScrollToEnd()
        }
    }
}

extension CharacterListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(indexPath: indexPath)
    }
}
