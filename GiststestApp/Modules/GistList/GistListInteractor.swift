//
//  GistListInteractor.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//Copyright © 2018 WayRay. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GistListInteractor Class
final class GistListInteractor: Interactor {
}

// MARK: - GistListInteractor API
extension GistListInteractor: GistListInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension GistListInteractor {
    var presenter: GistListPresenterApi {
        return _presenter as! GistListPresenterApi
    }
}
