//
//  Character.swift
//  Zombies
//
//  Created by informatique on 09/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import Foundation

struct Character: Human {
    var name: String
    var hp: Int
    var location: (x:Int, y:Int) = (x:0, y:0)
    var kills: Int
    var pa: Int
}