//
//  ViewController.swift
//  TicTacToe
//
//  Created by Toph on 12/9/15.
//  Copyright © 2015 Toph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = beets, 2 = avocadOs
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
        [0, 4, 8], [2, 4, 6] // Diagonal
    ]
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var restartGameLabel: UIButton!
    
    @IBAction func restartGame(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center.y -= view.bounds.height
        
        var buttonToClear: UIButton!
        
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "beet.png"), forState: .Normal)
                
                activePlayer = 2
                
            }
            else {
                
                sender.setImage(UIImage(named: "avocado.png"), forState: .Normal)
                
                activePlayer = 1
                
            }
        }
        
        for combination in winningCombinations{

            if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                
                gameActive = false
        
                
                if (gameState[combination[0]] == 1){
                    
                    gameOverLabel.text = "Beets win!"
                    gameOverLabel.layer.cornerRadius = 10
                    
                }
                else{
                    
                    gameOverLabel.text = "Avocados win!"
                    gameOverLabel.layer.cornerRadius = 10
                    
                }
                
                gameOverLabel.hidden = false
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                    self.gameOverLabel.center.y += self.view.bounds.height
                    
                })
            }
            
            gameActive = false
            
            for buttonState in gameState {
                
                if buttonState == 0 {
                    
                    gameActive = true
                    
                }
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        gameOverLabel.center.y -= view.bounds.height
        gameOverLabel.layer.masksToBounds = true
        
        restartGameLabel.layer.cornerRadius = 10
        restartGameLabel.layer.masksToBounds = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

