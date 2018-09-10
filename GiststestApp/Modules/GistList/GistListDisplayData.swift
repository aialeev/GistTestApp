//
//  GistListDisplayData.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//Copyright © 2018 WayRay. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GistListDisplayData class
final class GistListDisplayData: DisplayData {
    
    private weak var tableView: UITableView!
    private var dataSource = TableViewDataSource()
    
    func prepareTable(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.dataSource = dataSource
    }
    
    func setData(_ gists: [GistModel]) {
        dataSource.setData(gists)
        tableView.reloadData()
    }
}

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    private var gists = [GistModel]()
    
    static let cellIdentifier = "cellIdentifier"
    
    func setData(_ gists: [GistModel]) {
        self.gists = gists
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewDataSource.cellIdentifier, for: indexPath)
        let gist = gists[indexPath.row]
        cell.textLabel?.text = gist.description
        cell.detailTextLabel?.text = gist.login
        return cell
    }
}
