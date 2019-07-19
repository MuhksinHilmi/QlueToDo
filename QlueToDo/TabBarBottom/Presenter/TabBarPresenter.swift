//
//  TabBarPresenter.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

class TabBarPresenter: TabBarBottomViewToPresenterProtocol {
    
    var view: TabBarBottomPresenterToViewProtocol?
    var interactor: TabBarBottomPresenterToInteractorProtocol?
    var router: TabBarBottomPresenterToRouterProtocol?
    
    func setupTabController() {
        interactor?.getBottomMenu()
    }
}

extension TabBarPresenter: TabBarBottomInteractorToPresenterProtocol {
 
    func getViewController(menuBar: [MenuBar]) {
        var controllers: [UIViewController] = []
        var i: Int = 0
        for value in menuBar {
            var controller: UIViewController!
            controller = router?.controllerView(value)
            controller.tabBarItem = view?.getTabBarItem(menu: value)
            controllers.insert(controller, at: i)
            i += 1
        }
        view?.getControllers = controllers
    }
}
