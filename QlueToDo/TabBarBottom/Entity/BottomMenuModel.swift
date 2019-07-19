//
//  BottomMenuModel.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

enum MenuBar {
    case listTodo, inProgress, done
    
    var title: String {
        switch self {
        case .listTodo:
            return "To Do"
        case .inProgress:
            return "In Progress"
        case .done:
            return "Done"
        }
    }
    
    var router: UIViewController {
        switch self {
        case .listTodo:
            return ListRouter.createModule()
        default:
            return ListRouter.createModule()
        }
    }
    
    var selectedImage: UIImage {
        return UIImage()
    }
    
    var defaultImage: UIImage {
        return UIImage()
    }
}

protocol Service {
    func toArray() -> [MenuBar]
}

struct BottomMenu: Service {
    func toArray() -> [MenuBar] {
        return [.listTodo, .inProgress, .done]
    }
}

struct BottomMenuModel {
    let bottomMenu: BottomMenu = BottomMenu()
    var controllerView: [UIViewController]
    var itemBar: [UITabBarItem]
}
