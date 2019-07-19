//
//  TabBarRouter.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

class TabBarRouter: TabBarBottomPresenterToRouterProtocol {
    
    static func createModule() -> TabBarViewController {
        let controller = TabBarViewController()
        return controller
    }
    
    func controllerView(_ menu: MenuBar) -> UIViewController {
        return menu.router
    }
}
