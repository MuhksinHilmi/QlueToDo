//
//  ListToDoTableViewCell.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

class ListToDoTableViewCell: BaseTableViewCell {

    var dataSource: ListToDoModel?
    var title: UILabel = {
        return UILabel()
    }()

    var content: UILabel = {
        return UILabel()
    }()
    
    var addButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("add to in Progress", for: .normal)
       return button
    }()
    
    override func prepareView() {
        content.numberOfLines = 0
        addSubview(title)
        addSubview(content)
    }
    
    override func setConstraintsView() {
        title.snp.makeConstraints { (cons) in
            cons.top.left.right.equalTo(20)
        }
        
        content.snp.makeConstraints { (cons) in
            cons.top.equalTo(title.snp.bottom).offset(10)
            cons.bottom.left.right.equalTo(20)
        }
    }
    
    func setDataSource(dataSource: ListToDoModel) {
        self.dataSource = dataSource
        title.text = dataSource.title
        content.text = dataSource.body
    }
    
    func addAction() {
        
    }
}
