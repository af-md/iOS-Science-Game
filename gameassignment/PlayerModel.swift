//
//  PlayerModel.swift
//  gameassignment
//
//  Created by user185105 on 5/10/21.
//


class PlayerModel {
    var points:Int = 0
    var health:Int = 5
    var name:String = ""
    
    init() {
    }
    
    init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
    public func getName() -> String {
        return name
    }
    
    public func getHealth() -> Int {
        return health
    }
    
    public func getPoints() -> Int {
        return points
    }
    
    public func setName(name: String) {
        self.name = name
    }
    
    public func decreaseHealth()  {
        self.health -= 1
    }
    
    public func increasePoints()  {
        self.points += 1
    }
}
