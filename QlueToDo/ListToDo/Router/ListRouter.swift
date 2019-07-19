//
//  ListRouter.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation

class ListRouter: ListPresenterToRouterProtocol {
    static func createModule() -> ListToDoViewController {
        let controller = ListToDoViewController()
        let presenter: ListToDoViewToPresenterProtocol & ListInteractorToPresenterProtocol = ListPresenter()
        let interactor: ListPresenterToInteractorProtocol = ListInteractor(serviceApi: .getList)
        let router:ListPresenterToRouterProtocol = ListRouter()
        
        controller.presenter = presenter
        controller.title = "List To Do"
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return controller
    }
}
