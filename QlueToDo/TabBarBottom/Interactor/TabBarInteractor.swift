//
//  TabBarInteractor.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation

class TabBarInteractor: TabBarBottomPresenterToInteractorProtocol {
    var presenter: TabBarBottomInteractorToPresenterProtocol?
    var menuBar:[MenuBar] = [.listTodo, .inProgress, .done]
    func getBottomMenu() {
        presenter?.getViewController(menuBar: menuBar)
    }
}
