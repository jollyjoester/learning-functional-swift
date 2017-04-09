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
    
    func minus(p: Position) -> Position {
        return Position(x: x - p.x, y: y - p.y)
    }
    
    var length: Double {
        return sqrt(x * x + y * y)
    }
}

struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
    
    func EngageShip1(target: Ship, friendly: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        
        return targetDistance <= firingRange
    }

    func canSafelyEngageShip1(target: Ship, friendly: Ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistance = sqrt(dx * dx + dy * dy)
        
        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)
        
        return targetDistance <= firingRange && targetDistance > unsafeRange && (friendlyDistance > unsafeRange)
    }
    
    func canSafelyEngageShip2(target: Ship, friendly: Ship) -> Bool {
        let targetDistance = target.position.minus(p: position).length
        let friendlyDistance = friendly.position.minus(p: target.position).length
        return targetDistance <= firingRange && targetDistance > unsafeRange && (friendlyDistance > unsafeRange)
    
    }
}