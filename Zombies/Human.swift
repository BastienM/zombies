//
//  Human.swift
//  Zombies
//
//  Created by informatique on 09/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import Foundation

enum Direction {
    case Up
    case Down
    case Left
    case Right
}

protocol Human {
    var location: (x:Int, y:Int) { get set }
    var pa: Int { get set }
}

extension Human {
    func emulateMove(direction: Direction) -> (x: Int, y: Int){
        switch direction {
        case .Up:
            return (x: self.location.x, y: self.location.y + 1)
        case .Down:
            return (x: self.location.x, y: self.location.y - 1)
        case .Right:
            return (x: self.location.x + 1, y: self.location.y)
        case .Left:
            return (x: self.location.x - 1, y: self.location.y)
        }
    }
    
    mutating func move(direction: Direction) {
        switch direction {
        case .Up:
            self.location.y += 1
        case .Down:
            self.location.y -= 1
        case .Right:
            self.location.x += 1
        case .Left:
            self.location.x -= 1
        }
    }
}

protocol Zombified {
    var id: Int { get set }
}

extension Human where Self: Zombified {
    func aleatoryDirection() -> Direction {
        // must randomly pick a direction in the enum Direction
        return .Left
    }
}