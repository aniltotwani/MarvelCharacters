import Foundation

final class CharacterDetailsBuilder {
    let view: CharacterDetailsViewContract
    let presenter: CharacterDetailsPresenterContract

    init(view: CharacterDetailsViewContract = CharacterDetailsViewController.constructViewController(),
         presenter: CharacterDetailsPresenterContract = CharacterDetailsPresenter()) {
        self.view = view
        self.presenter = presenter
    }

    func build(id: Int) -> CharacterDetailsViewContract {
        view.presenter = presenter
        presenter.view = view
        presenter.characterID = id
        return view
    }
}
