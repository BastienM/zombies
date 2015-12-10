//
//  ViewController.swift
//  Zombies
//
//  Created by informatique on 09/12/2015.
//  Copyright © 2015 informatique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /**
     * @Zombies core
     */
    let settings = Settings(grid: (width:20, height:20), zombieSpawningRate: 3, initialPlayerHp: 100)
    var grid: Array<Array<Any?>> = []
    var zombies: Array<Zombie> = []
    
    // Initialize the game's grid to default width and height
    func initGrid() -> Array<Array<Any?>> {
        var array = Array<Array<Any?>>()
        for _ in 0...self.settings.grid.height {
            array.append(Array(count:self.settings.grid.width, repeatedValue:Any?()))
        }
        
        return array
    }
    
    func getGridPosition(location: (x: Int,y: Int)) -> Any? {
        return self.grid[location.x][location.y]
    }
    
    // Automatic spawn of the player at the center of the grid
    func spawnPlayer() -> Character {
        
        let defaultLocation = (x:Int(settings.grid.width/2), y:Int(settings.grid.height/2))
        let player: Character = Character(name: "P1", hp: settings.initialPlayerHp, location: defaultLocation, kills: 0, pa: 1)
        
        self.grid[defaultLocation.x][defaultLocation.y] = player
        
        return player
    }
    
    // Automatic zombie spawning in random location on the grid
    func spawnZombie() -> Zombie {
        
        var zombie: Zombie?
        var randomLocation = (x:0, y:0)
        
        repeat {
            randomLocation = self.randomLocation()
        } while (self.grid[randomLocation.x][randomLocation.y] != nil)
        
        let latestZombie = self.zombies.last
        if (latestZombie != nil) {
            zombie = Zombie(id: latestZombie!.id+1, location: randomLocation, pa: 1)
        } else {
            zombie = Zombie(id: 1, location: randomLocation, pa: 1)
        }
        
        self.zombies.append(zombie!)
        self.grid[randomLocation.x][randomLocation.y] = zombie!
        
        return zombie!
    }
    
    func randomLocation() -> (x: Int, y:Int) {
        return (x: Int(arc4random_uniform(UInt32(settings.grid.width))), y: Int(arc4random_uniform(UInt32(settings.grid.height))))
    }
    
    enum Direction {
        case Up
        case Down
        case Left
        case Right
    }
    
    /**
     * @Zombies view elements
     */
    @IBOutlet var canvas: UIView!
    
    @IBAction func swipeUp(sender: AnyObject) {
        print("Going UP")
    }
    
    @IBAction func swipeDown(sender: AnyObject) {
        print("Going DOWN")
    }
    
    @IBAction func swipeLeft(sender: AnyObject) {
        print("Going LEFT")
    }
    
    @IBAction func swipeRight(sender: AnyObject) {
        print("Going RIGHT")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.grid = self.initGrid()
        
        let player = spawnPlayer()
        
        for _ in 1...10 {
            spawnZombie()
        }
        
        self.move(player, direction: .Up)
        
        let zombie = self.zombies[1]
        //@TODO : fix enum name colision
        self.move(zombie, direction: zombie.aleatoryDirection())
        
    }
    
    func move(var target: Human, direction: Direction) {
        let targetLocation = target.emulateMove(.Up)
        let nextLocation = getGridPosition((x: targetLocation.x, y: targetLocation.y))
        
        if(nextLocation == nil) {
            target.move(.Up)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

