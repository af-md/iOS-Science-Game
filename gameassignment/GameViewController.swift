//
//  GameController.swift
//  gameassignment
//
//  Created by user185105 on 5/6/21.
//

import UIKit
import SpriteKit

class GameViewController : UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a scene object from GameScene class
        let scene = GameScene(size: view.bounds.size)
        
        // forcefully cast view into SKView
        let skView = view as! SKView
        
        // set size
        scene.scaleMode = .resizeFill
        
        scene.gameViewController = self
        
        // pressent scene
        skView.presentScene(scene)
        
    }
    
    // called from within the Game Scene to present the leader board controller
    public func presentLeaderBoardController() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let leaderBoardView  = storyBoard.instantiateViewController(withIdentifier: "LeaderBoardViewController") as! LeaderBoardViewController
        navigationController?.pushViewController(leaderBoardView, animated: true)
    }
    
}
