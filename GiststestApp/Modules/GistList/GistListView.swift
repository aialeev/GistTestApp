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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData.prepareTable(tableView)
        tableView.delegate = self
        configureRefreshControl()
    }
    
    private func configureRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
    }
    
     @objc private func refreshControlAction() {
        presenter.updateInitialazed()
    }
}

//MARK: - GistListView API
extension GistListView: GistListViewApi {
    func setLoadingState(_ isLoading: Bool) {
        if isLoading {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
    
    func setDataList(_ list: [GistModel]) {
        displayData.setData(list)
    }
    
    func showError(_ error: Error) {
        //TODO:
    }
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

extension GistListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(indexPath)
    }
}
