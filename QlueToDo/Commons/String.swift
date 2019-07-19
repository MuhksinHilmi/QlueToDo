//
//  String.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation
extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
