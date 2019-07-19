//
//  ListPresenter.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation
import CoreData

class ListPresenter: ListToDoViewToPresenterProtocol {
    var view: ListPresenterToViewProtocol?
    var interactor: ListPresenterToInteractorProtocol?
    var router: ListPresenterToRouterProtocol?
    
    func fetchingListTodo() {
        interactor?.fetchingList()
    }
    
    func save(result: ListToDo) {
        
        let managedContext = CoreDataStack.shared.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ListToDo", in: managedContext)!
        let news = NSManagedObject(entity: entity, insertInto: managedContext)
        
        news.setValue(result.id, forKeyPath: "id")
        news.setValue(result.userId, forKeyPath: "userId")
        news.setValue(result.title, forKeyPath: "title")
        news.setValue(result.body, forKeyPath: "body")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

extension ListPresenter: ListInteractorToPresenterProtocol {
    func listToDoFetchedSuccess(model: [ListToDoModel]) {
        view?.showListData(model: model)
    }
}
