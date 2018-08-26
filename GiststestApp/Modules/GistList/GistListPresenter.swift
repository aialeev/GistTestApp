//
//  GistListPresenter.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//Copyright © 2018 WayRay. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GistListPresenter Class
final class GistListPresenter: Presenter {
    
    override func setupView(data: Any) {
        updateInitialazed()
    }
}

// MARK: - GistListPresenter API
extension GistListPresenter: GistListPresenterApi {
    func updateDidFinised(_ result: UploadingResult<[GistModel]>) {
        view.setLoadingState(false)
        switch result {
        case .success(let list):
            view.setDataList(list)
        case .fail(let errot):
            view.showError(errot)
        }
    }
    
    func didSelectItem(_ indexPath: IndexPath) {
        router.showGist(interactor.item(at: indexPath))
    }
    
    func updateInitialazed() {
        view.setLoadingState(true)
        interactor.updateList()
    }
}

// MARK: - GistList Viper Components
private extension GistListPresenter {
    var view: GistListViewApi {
        return _view as! GistListViewApi
    }
    var interactor: GistListInteractorApi {
        return _interactor as! GistListInteractorApi
    }
    var router: GistListRouterApi {
        return _router as! GistListRouterApi
    }
}
