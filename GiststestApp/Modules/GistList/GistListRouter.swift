//
//  GistListRouter.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//Copyright © 2018 WayRay. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GistListRouter class
final class GistListRouter: Router {
}

// MARK: - GistListRouter API
extension GistListRouter: GistListRouterApi {
}

// MARK: - GistList Viper Components
private extension GistListRouter {
    var presenter: GistListPresenterApi {
        return _presenter as! GistListPresenterApi
    }
}
