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
    var innerGistList: [GistModel]?
}

// MARK: - GistListInteractor API
extension GistListInteractor: GistListInteractorApi {
    func updateList() {
        //TODO:
        NetworkService.GETRequest("/gists/public", parameters: nil) { (data, error) in
            
            if error != nil {
                self.wrapUpdateDidFinished(.fail(error!))
            } else if let jsonData = data {
                do {
                    let array = try JSONDecoder().decode([Gist].self, from: jsonData)
                    
                    self.wrapUpdateDidFinished(.success(array))
                } catch {
                    self.wrapUpdateDidFinished(.fail(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Parsing error"])))
                }
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> GistModel? {
        return innerGistList?[indexPath.row]
    }
    
    private func wrapUpdateDidFinished(_ result: UploadingResult<[GistModel]>){
        DispatchQueue.main.async {
            self.presenter.updateDidFinised(result)
        }
    }
    
}

// MARK: - Interactor Viper Components Api
private extension GistListInteractor {
    var presenter: GistListPresenterApi {
        return _presenter as! GistListPresenterApi
    }
}
