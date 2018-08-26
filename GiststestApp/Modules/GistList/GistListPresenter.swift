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
}

// MARK: - GistListPresenter API
extension GistListPresenter: GistListPresenterApi {
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
