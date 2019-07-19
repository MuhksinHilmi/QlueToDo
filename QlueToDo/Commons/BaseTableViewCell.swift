//
//  BaseTableCell.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    class var identifier: String { return String.className(self) }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        self.prepareView()
        self.setConstraintsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.prepareView()
        self.setConstraintsView()
    }
    
    func prepareView() {}
    
    func setConstraintsView() {}
}
