//
//  GameData.swift
//  gameassignment
//
//  Created by user185105 on 5/11/21.
//


class GameData {
    var players = [PlayerModel]()
    
    init()
    {
        players.append(PlayerModel(name: "Abdul", points: 10))
        players.append(PlayerModel(name: "Jackie", points: 8))
        players.append(PlayerModel(name: "Adam", points: 6))
        players.append(PlayerModel(name: "Marco", points: 5))
    }
    
    open func getPlayerData()->[PlayerModel]
    {
        return players
    }
}
