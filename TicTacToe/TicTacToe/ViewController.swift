

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet var buttonArray: [UIButton]!
    
    @IBOutlet weak var pOneWinCount: UILabel!
    @IBOutlet weak var playersTurn: UILabel!
    
    @IBOutlet weak var pTwoWinCount: UILabel!
    @IBOutlet weak var turnsLeft: UILabel!
    var uiLabelArray:[UILabel] = []
    var allButtons:[UIButton] = []
    var playerOne:String!
    var playerTwo:String!
    var possibleOutcomesUILabels: [[UILabel]] = [[]]
   var mod = Mod()
    
    var currentPlayer: PlayerSelector = .playerOne
    
    override func viewDidLoad() {
        
    super.viewDidLoad()
        
        uiLabelArray = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
        possibleOutcomesUILabels = [[label1,label2,label3],
                                    [label4,label5,label6] , [label7,label8,label9], [label1,label5,label9],  [label2,label5,label8],[label3,label6,label9],[label3,label5,label7],
                                        [label1,label4,label7]]
    
        uiLabelArray.forEach({$0.alpha = 0})
        
        playersTurn.text = "\(playerOne!), Begin!"
        
        turnsLeft.alpha = 0
  }

    func disableButtons() {
      buttonArray.forEach({$0.isEnabled = false})
    }

    func enableButtons() {
      buttonArray.forEach({$0.isEnabled = true})
    }
    
    func howManyTurnsAreLeftFunc(){
        turnsLeft.alpha = 1
        switch allButtons.count{
        case 1...7:
            turnsLeft.text = "There are \(9 - allButtons.count) moves left"
        case 8:
            turnsLeft.text = "There is only \(9 - allButtons.count) move left"
        default:
            turnsLeft.text = "There are no more moves left"
        }
    }
    
    func winCondition()  {
        for wins in possibleOutcomesUILabels {
            if mod.X.contains(wins[0].text!) && mod.X.contains(wins[1].text!) && mod.X.contains(wins[2].text!)   {
                playersTurn.text = "\(playerOne!) wins!"
                mod.incrementorX()
                pOneWinCount.text = "Player One Wins :\(mod.playerOneWinCount)"
               turnsLeft.alpha = 0
                
               disableButtons()
                break
            }
            else if  mod.Y.contains(wins[0].text!) && mod.Y.contains(wins[1].text!) && mod.Y.contains(wins[2].text!)   {

                playersTurn.text = " \(playerTwo!) wins!"
                turnsLeft.alpha = 0
                mod.incrementorO()
                pTwoWinCount.text = "Player Two Wins :\(mod.playerTwoWinCount)"
                disableButtons()
            break
            } else {
                if allButtons.count == 9 {
                playersTurn.text = "The game is a draw!"
            }
    }
    }
    }
   
   
    
    @IBAction func ticTacToeButtons(_ sender: UIButton) {
        
        switch currentPlayer{
        case.playerOne:
            
            

            uiLabelArray[sender.tag].text = currentPlayer.symbol()
            uiLabelArray[sender.tag].alpha = 1
            sender.isEnabled = false
            allButtons += [sender]
           
            playersTurn.text = "\(playerTwo!)'s turn"
            
            howManyTurnsAreLeftFunc()
            currentPlayer = .playerTwo
            winCondition()
            
        case .playerTwo:
            uiLabelArray[sender.tag].text = currentPlayer.symbol()
            uiLabelArray[sender.tag].alpha = 1
            sender.isEnabled = false
            allButtons += [sender]
            playersTurn.text = "\(playerOne!)'s turn"
            
            howManyTurnsAreLeftFunc()
            currentPlayer = .playerOne
            winCondition()
            }
        }
    
    
    @IBAction func newGame(_ sender: UIButton) {

        uiLabelArray.forEach({$0.alpha = 0})
        uiLabelArray.forEach({$0.text = ""})
        allButtons.forEach({$0.isEnabled = true})
        allButtons = []
        turnsLeft.alpha = 0
        currentPlayer = .playerOne
        playersTurn.text = "\(playerOne!), Begin!"

       enableButtons()
}
    @IBAction func backToMainScreen(_ sender: UIButton) {
        uiLabelArray.forEach({$0.alpha = 0})
        uiLabelArray.forEach({$0.text = ""})
        allButtons.forEach({$0.isEnabled = true})
        allButtons = []
        turnsLeft.alpha = 0
        currentPlayer = .playerOne
        playersTurn.text = "\(playerOne!), Begin!"
        mod.reset()
        enableButtons()
    }
    
}

