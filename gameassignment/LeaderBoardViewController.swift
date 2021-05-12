//
//  LeaderBoardViewController.swift
//  gameassignment
//
//  Created by user185105 on 5/11/21.
//

import UIKit
import SpriteKit

class LeaderBoardViewController : UIViewController,
                                  UITableViewDataSource,
                                  UITableViewDelegate {
    
    // identify the cell
    let cellIdentifier = "cellIdentifier"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.gameData.getPlayerData().count
    }
    
    // creates a table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath as IndexPath)
        let players = appDelegate.gameData.getPlayerData()
        cell.textLabel?.text = String(players[indexPath.row].getName()) + "         " + String(players[indexPath.row].getPoints())
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayerToGameData()
    }
    
    // add the header to the table
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Name         Points"
    }
    
    // adds the data of the current player to the existent game data
    func addPlayerToGameData() {
        let player = appDelegate.player
        
        if !player.getName().isEmpty {
            
            let gameData = appDelegate.gameData.getPlayerData()
            
            let object = gameData.firstIndex(where: { $0.getName() == player.getName()})
            
            if object == nil {
                appDelegate.gameData.players.append(player)
            }
        }
    }
}
