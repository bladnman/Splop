//
//  PropertyReflectable.swift
//  Jumper
//
//  Created by Maher, Matt on 2/13/21.
//

import Foundation
protocol PropertyReflectable { }

extension PropertyReflectable {
    subscript(key: String) -> Any? {
        let m = Mirror(reflecting: self)
        return m.children.first { $0.label == key }?.value
    }
}
