//
//  SKNode+Extensions.swift
//  Super Indie Runner
//
//  Created by Maher, Matt on 1/22/21.
//

import SpriteKit

public func * (vector: CGVector, scalar: CGFloat) -> CGVector {
  return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
}
public func * (size: CGSize, scalar: CGFloat) -> CGSize {
  return CGSize(width: size.width * scalar, height: size.height * scalar)
}
public func *= (size: inout CGSize, scalar: CGFloat) {
  size = size * scalar
}
public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}
public func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
public func += (left: inout CGPoint, right: CGPoint) {
  left = left + right
}
public func - (point1: CGPoint, point2: CGPoint) -> CGPoint {
  return CGPoint(x: point1.x - point2.x, y: point1.y - point2.y)
}

extension CGFloat {
    func roundTo(places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
