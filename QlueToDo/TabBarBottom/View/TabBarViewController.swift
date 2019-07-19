//
//  TabBarViewController.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var presenter: TabBarBottomViewToPresenterProtocol?
    var bottom: UIColor = .lightGray
    var getControllers: [UIViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProtocol()
        self.presenter?.setupTabController()
        setupNavigationView()
    }
    
    func setupProtocol() {
        let presenter: TabBarBottomViewToPresenterProtocol & TabBarBottomInteractorToPresenterProtocol = TabBarPresenter()
        let interactor: TabBarBottomPresenterToInteractorProtocol = TabBarInteractor()
        let router:TabBarBottomPresenterToRouterProtocol = TabBarRouter()
        self.presenter = presenter
        self.title = "Qlue To Do"
        presenter.view = self
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    private func setupNavigationView() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.delegate = self
        self.viewControllers = getControllers
        self.selectedIndex = 0
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = bottom
    }
}

extension TabBarViewController: TabBarBottomPresenterToViewProtocol {
    
    func getTabBarItem(menu: MenuBar) -> UITabBarItem {
        print(menu.title)
        let tabBarItem = UITabBarItem()
        tabBarItem.selectedImage = menu.selectedImage.withRenderingMode(.alwaysOriginal)
        tabBarItem.image = menu.defaultImage.withRenderingMode(.alwaysOriginal)
        tabBarItem.title = menu.title
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)], for: .normal)
        
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)], for: .selected)
        
        return tabBarItem
    }
}
