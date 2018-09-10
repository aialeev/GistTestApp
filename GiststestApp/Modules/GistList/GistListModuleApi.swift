//
//  GistListModuleApi.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//Copyright © 2018 WayRay. All rights reserved.
//

import Viperit

//MARK: - GistListRouter API
protocol GistListRouterApi: RouterProtocol {
    func showGist(_ gist:GistModel)
}

//MARK: - GistListView API
protocol GistListViewApi: UserInterfaceProtocol {
    func setLoadingState(_ isLoading:Bool)
    func setDataList(_ list: [GistModel])
    func showError(_ error: Error)
}

//MARK: - GistListPresenter API
protocol GistListPresenterApi: PresenterProtocol {
    func updateInitialazed()
    func updateDidFinised(_ result:UploadingResult<[GistModel]>)
    func didSelectItem(_ indexPath:IndexPath)
}

//MARK: - GistListInteractor API
protocol GistListInteractorApi: InteractorProtocol {
    func updateList()
    func item(at indexPath:IndexPath) -> GistModel?
}
