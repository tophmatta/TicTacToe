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
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
        [0, 4, 8], [2, 4, 6] // Diagonal
    ]
    
    
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0{
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "beet.png"), forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "avocado.png"), forState: .Normal)
                
                activePlayer = 1
                
            }
        
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

