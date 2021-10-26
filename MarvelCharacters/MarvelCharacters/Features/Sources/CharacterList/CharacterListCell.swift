import Kingfisher
import UIKit

class CharacterListCell: UICollectionViewCell {
    @IBOutlet private weak var CharactersImageView: UIImageView!
    @IBOutlet private weak var CharactersNameLabel: UILabel!


    func setup(model: CharacterListCellViewModel?) {
        guard let model = model else {
            return
        }
        let placeHolder = UIImage(named: "placeholder")
        CharactersNameLabel.text = model.name
        CharactersImageView.kf.indicatorType = .activity
        CharactersImageView.kf.setImage(with: model.imageURL,
                                        placeholder: placeHolder,
                                        options: nil,
                                        completionHandler: nil)
    }
}
