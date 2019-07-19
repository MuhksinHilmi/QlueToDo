//
//  TabBarProtocol.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

protocol TabBarBottomViewToPresenterProtocol: class {
    
    var view: TabBarBottomPresenterToViewProtocol? {get set}
    var interactor: TabBarBottomPresenterToInteractorProtocol? {get set}
    var router: TabBarBottomPresenterToRouterProtocol? {get set}
    func setupTabController()
}

protocol TabBarBottomPresenterToViewProtocol: class {
    func getTabBarItem(menu: MenuBar) -> UITabBarItem
    var getControllers: [UIViewController]? {get set}
}

protocol TabBarBottomPresenterToRouterProtocol: class {
    static func createModule()-> TabBarViewController
    func controllerView(_ menu: MenuBar) -> UIViewController
    
}

protocol TabBarBottomPresenterToInteractorProtocol: class {
    var presenter:TabBarBottomInteractorToPresenterProtocol? {get set}
    func getBottomMenu()
}

protocol TabBarBottomInteractorToPresenterProtocol: class {
    func getViewController(menuBar: [MenuBar])
}

