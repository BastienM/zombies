//
//  Zombie.swift
//  Zombies
//
//  Created by informatique on 09/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import Foundation

struct Zombie: Human, Zombified {
    var id: Int
    var location: (x:Int, y:Int)
    var pa: Int
}