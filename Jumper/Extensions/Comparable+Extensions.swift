//
//  Comparable+Extensions.swift
//  Jumper
//
//  Created by Maher, Matt on 2/12/21.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
