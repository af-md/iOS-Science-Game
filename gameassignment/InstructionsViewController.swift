//
//  InstructionsViewController.swift
//  gameassignment
//
//  Created by user185105 on 5/11/21.
//

import UIKit
import SpriteKit

class InstructionsViewController : UIViewController {
    
    // outlet used to check if player was inserted
    @IBOutlet weak var editText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func allowGamePlay(_ sender: Any) {
        // check if players name was inserted
        if !(editText.text!.isEmpty) {
            
            // store player name
            let player = appDelegate.player
            player.setName(name: editText.text ?? "")
            
            // show the gameview
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let gameView  = storyBoard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            navigationController?.pushViewController(gameView, animated: true)
        }
    }
}
