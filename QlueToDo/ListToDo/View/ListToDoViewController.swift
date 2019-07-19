//
//  ListToDoViewController.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit
import SnapKit

class ListToDoViewController: UIViewController, UITableViewDataSource {
    
    var presenter:ListToDoViewToPresenterProtocol?
    var tableView: UITableView = {
       return UITableView()
    }()
    var source: [ListToDoModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchingListTodo()
        prepareView()
    }
    
    func prepareView() {
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.registerCellClass(ListToDoTableViewCell.self)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (cons) in
            cons.edges.equalTo(view)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListToDoTableViewCell(style: ListToDoTableViewCell.CellStyle.subtitle, reuseIdentifier: ListToDoTableViewCell.identifier)
        if let source = source {
            cell.setDataSource(dataSource: source[indexPath.row])
        }
        return cell
    }
}

extension ListToDoViewController: ListPresenterToViewProtocol {
    func showListData(model: [ListToDoModel]) {
        source = model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
