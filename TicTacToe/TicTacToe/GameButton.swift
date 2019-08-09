

import UIKit

class ViewTwo: UIViewController, UITextFieldDelegate {
    var playerOne:String?
    var playerTwo:String?
    
    
    @IBOutlet weak var playerTwoName: UILabel!
    @IBOutlet weak var playerOneName: UILabel!
    @IBOutlet weak var playerTwoField: UITextField!
    @IBOutlet weak var PlayerOneField: UITextField!
    
    
    override func viewDidLoad() {
     PlayerOneField.delegate = self
        playerTwoField.delegate = self
        
        playerOneName.text = "Enter your name to begin"
        playerTwoName.text = "Enter your name to begin"
        super.viewDidLoad()

    }
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == PlayerOneField {
        playerOne = PlayerOneField.text 
            playerOneName.text = PlayerOneField.text
            textField.resignFirstResponder()
            return true
        } else if textField == playerTwoField {
            playerTwo = playerTwoField.text
            playerTwoName.text = playerTwoField.text

            textField.resignFirstResponder()
            return true
        }
        
        textField.resignFirstResponder()
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
           
            
           
            let destinationVC = segue.destination as! ViewController
            destinationVC.playerOne = playerOne ?? "Player One" //
            destinationVC.playerTwo = playerTwo ?? "Player Two"
     //   }
        
    }
}


