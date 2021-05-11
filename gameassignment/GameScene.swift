//
//  GameScene.swift
//  gameassignment
//
//  Created by user185105 on 5/6/21.
//

import SpriteKit

class GameScene : SKScene, SKPhysicsContactDelegate {
    
    // sprite nodes with cell images
    let redCell = SKSpriteNode(imageNamed: "Red Cell.jpeg")
    let whiteCell = SKSpriteNode(imageNamed: "White Cell.jpeg")
    let pathogen = SKSpriteNode(imageNamed: "Pathogen.jpeg")
    let playerCell = SKSpriteNode(imageNamed: "Predator Cell.jpeg")
    
    // set categories for detection
    let cellCategory:UInt32 = 0x1 << 0;
    let playerCategory:UInt32 = 0x1 << 1;

    
    // delegates for model retrival
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    let healthLabel = SKLabelNode()
    let pointsLabel = SKLabelNode()
    
    var gameViewController:GameViewController!
    
    override func didMove(to view: SKView) {
        
        // set physic world in this view
        physicsWorld.contactDelegate = self

        // name each node
        redCell.name = "redcell"
        whiteCell.name = "whitecell"
        pathogen.name = "pathogen"
        playerCell.name = "playercell"
        
        // position the cell
        redCell.position = CGPoint(x: 60, y: size.height)
        whiteCell.position = CGPoint(x: 200, y: size.height + 80)
        pathogen.position = CGPoint(x: 350, y: size.height + 140)
        playerCell.position = CGPoint(x: size.width/2, y: 60)
        
        // position each cell
        redCell.size = CGSize(width: 80, height: 80)
        whiteCell.size = CGSize(width: 80, height: 80)
        pathogen.size = CGSize(width: 80, height: 80)
        playerCell.size = CGSize(width: 80, height: 80)
        
        // add detection
        addPhisycs(node: redCell)
        addPhisycs(node: whiteCell)
        addPhisycs(node: pathogen)
        addPhisycs(node: playerCell)
        
        // add the node to the view
        addChild(redCell)
        addChild(whiteCell)
        addChild(pathogen)
        addChild(playerCell)
        
        
        // mode the cell downwards
        let moveDown = SKAction.moveBy(x: 0, y: -1500, duration: 15)
        
        // move downwards forever
        redCell.run(SKAction.repeatForever(moveDown))
        whiteCell.run(SKAction.repeatForever(moveDown))
        pathogen.run(SKAction.repeatForever(moveDown))
        
        // points and health
        healthLabel.text = "Health: " + String(appDelegate.player.getHealth())
        healthLabel.color = UIColor.black
        healthLabel.fontSize = 20
        healthLabel.position = CGPoint(x: 140, y: 750);
        
        pointsLabel.text = "Points: " + String(appDelegate.player.getPoints())
        pointsLabel.color = UIColor.black
        pointsLabel.fontSize = 20
        pointsLabel.position = CGPoint(x: 300, y: 750);

        addChild(pointsLabel)
        addChild(healthLabel)
        
        // add background color
        view.scene?.backgroundColor = UIColor.orange
}
    // adds physic for detection to each node
    func addPhisycs(node: SKSpriteNode) {
        node.physicsBody = SKPhysicsBody(rectangleOf: node.frame.size)
        node.physicsBody?.categoryBitMask = node.name == "playercell" ? playerCategory : cellCategory
        node.physicsBody?.contactTestBitMask = node.name == "playercell" ? cellCategory : playerCategory
        node.physicsBody?.isDynamic = true
        node.physicsBody?.affectedByGravity = false
    }

    
    var playerLocation = CGPoint()
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
                let touch = touches.first
                if let location = touch?.location(in: self) {
                 
                   let movePlayer = SKAction.moveTo(x: location.x, duration: 0)
                   playerCell.run(movePlayer)
                }
            }
    

    func didBegin(_ contact: SKPhysicsContact) {
        let move2 = SKAction.moveTo(y: size.height, duration:0)

        if contact.bodyA.node == redCell {
            redCell.run(move2)
            appDelegate.player.increasePoints()
        }
        
        if contact.bodyA.node == whiteCell {
            whiteCell.run(move2)
            appDelegate.player.increasePoints()
        }
        
        if contact.bodyA.node == pathogen {
            pathogen.run(move2)
            appDelegate.player.decreaseHealth()
        }
        
        // change this to 0
        if appDelegate.player.getHealth() == 4 {
            gameViewController.presentLeaderBoardController()
        }
        
    }

    override func update(_ currentTime: TimeInterval) {
        
        // reset cells position to slide down again
        if redCell.position.y < 0 {
            redCell.position = CGPoint(x: 60, y: size.height)
        }
        
        if whiteCell.position.y < 0 {
            whiteCell.position = CGPoint(x: 200, y: size.height + 80)
        }
        
        if pathogen.position.y < 0 {
            pathogen.position = CGPoint(x: 350, y: size.height + 140)
        }
        
        healthLabel.text = "Health: " + String(appDelegate.player.getHealth())
        pointsLabel.text = "Points: " + String(appDelegate.player.getPoints())
        
        
    }
}
