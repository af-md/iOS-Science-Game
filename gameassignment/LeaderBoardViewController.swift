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
    
    let cellIdentifier = "cellIdentifier"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.gameData.getPlayerData().count
    }
    
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Name         Points"
    }
    
    func addPlayerToGameData() {
        let player = appDelegate.player
        
        print(player.getName() + "  " + String(player.getPoints()))
        
        appDelegate.gameData.players.append(player)
    }
}
