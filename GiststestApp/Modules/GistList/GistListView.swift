//
//  GistListView.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//Copyright © 2018 WayRay. All rights reserved.
//

import UIKit
import Viperit

//MARK: GistListView Class
final class GistListView: UserInterface {
}

//MARK: - GistListView API
extension GistListView: GistListViewApi {
    
}

// MARK: - GistListView Viper Components API
private extension GistListView {
    var presenter: GistListPresenterApi {
        return _presenter as! GistListPresenterApi
    }
    var displayData: GistListDisplayData {
        return _displayData as! GistListDisplayData
    }
}
