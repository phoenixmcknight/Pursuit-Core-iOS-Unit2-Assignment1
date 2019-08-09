//
//  PlayerSelector.swift
//  TicTacToe
//
//  Created by Mr Wonderful on 8/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

enum PlayerSelector{
    
case playerOne
case playerTwo
    func symbol() -> String {
        switch self {
        case .playerOne:
            return "X"
        case .playerTwo:
            return "O"

    }
        
}
}
