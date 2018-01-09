//
//  ViewController.swift
//  GreatNumberGame
//
//  Created by user on 1/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var winningNumber = Int(arc4random_uniform(100) + 1)
    
    var didWin = false
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
        
        //Check if game is won already
        
        if didWin == true {
            
            return
        }
        
        // Validate input as a boolean
        let isValid = validateInput(inputField.text!)
        
        if isValid == false {
            
            return
        }
        
        //Check input versus winning number
        
        compareNums(num1: winningNumber, num2: inputField.text!)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(winningNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - input methods
    
    func alertUser(_ title: String, _ message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Try Again", style: .default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func validateInput(_ inputText: String) -> Bool {
        
        if inputField.text == nil {
            
            let message = "Please enter a number"
            
            let title = "Error"
            
            alertUser(title, message)
            
            return false
        }
        
        guard Int(inputField.text!) != nil else {
            
            let message = "Please enter a number"
            
            let title = "Error"
            
            alertUser(title, message)
            
            return false
        }

        return true
    }
    
    func compareNums(num1: Int, num2: String){
        
        var title = ""
        var message = ""
        
        let input = Int(num2)
        
        if num1 == input {
            
            title = "You Win!"
            message = "You guessed the correct number: \(num2)"
            didWin = true
            
        }
        
        else if num1 > input! {
            
            title = "Wrong number"
            message = "Hint: You guessed too low"
            
        }
        
        else if input! > num1 {
            
            title = "Wrong number"
            message = "Hint: You guessed too high"
            
        }
        
        alertUser(title, message)
    }

}

