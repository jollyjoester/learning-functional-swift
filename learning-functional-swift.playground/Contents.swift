//: Playground - noun: a place where people can play
import Foundation

typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    func inRange(range: Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
}

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    func canSafelyEngageShip(target: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy - target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        return targetDistance <= firingRange && targetDistance > unsafeRange
    }
}