//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit
class Mod {
    
    let X = ["X"]
    let Y = ["O"]
    var playerOneWinCount = 0
    var playerTwoWinCount = 0
   
     func incrementorX() {
        playerOneWinCount += 1
        
    }
    func incrementorO() {
        playerTwoWinCount += 1
        
    }
    func reset() {
        playerOneWinCount = 0
        playerTwoWinCount = 0
    }
}

    
    



