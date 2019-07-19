//
//  ListProtocol.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation

protocol ListToDoViewToPresenterProtocol: class{
    
    var view: ListPresenterToViewProtocol? {get set}
    var interactor: ListPresenterToInteractorProtocol? {get set}
    var router: ListPresenterToRouterProtocol? {get set}

    func fetchingListTodo()
    func save(result: ListToDo)
}

protocol ListPresenterToViewProtocol: class{
    func showListData(model: [ListToDoModel])
}

protocol ListPresenterToRouterProtocol: class {
    static func createModule()-> ListToDoViewController
    
}

protocol ListPresenterToInteractorProtocol: class {
    var presenter:ListInteractorToPresenterProtocol? {get set}
    func fetchingList()
    
}

protocol ListInteractorToPresenterProtocol: class {
    func listToDoFetchedSuccess(model:[ListToDoModel])
}
