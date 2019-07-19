//
//  ListInteractor.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation

class ListInteractor: ListPresenterToInteractorProtocol, FetchApiService {
    var serviceApi: ServiceAPI
    var presenter: ListInteractorToPresenterProtocol?
    private let service: FetchApiService? = nil
    
    init(serviceApi: ServiceAPI) {
        self.serviceApi = serviceApi
    }
    
    func fetchingList() {
        fetch(decodingType: [ListToDoModel].self) { (json, error) in
            guard let result = json as? [ListToDoModel] else { return }
            self.presenter?.listToDoFetchedSuccess(model: result)
        }
    }
}
