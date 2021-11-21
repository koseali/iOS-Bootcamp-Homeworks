//
//  ViewController.swift
//  HomeworkWeek-3
//
//  Created by Ali Kose on 13.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!
    
    //MARK: -VARIABLES
    var numberOne = 0.0
    var numberTwo = 0.0
    var firstNumberFlag = false
    var firstTappedFlag = true
    
   
    let mathManager = CalculatorManager()
    var operation = 0
    var result = 0.0
    
//MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - IBACTIONS
    @IBAction func numericButtonTapped(_ sender: UIButton) {
        
        if firstTappedFlag == true { // just clear initiliaze input text
            inputLabel.text = ""
            firstTappedFlag.toggle()
        }
        
        if firstNumberFlag == true {
            // If this flag true , i got first number and set again to second number with clear input label
            inputLabel.text = String(sender.tag)
            numberOne = Double(inputLabel.text!)!
            firstNumberFlag.toggle()
        }
        else {
            // get a another digit numbers after to first digit.
            inputLabel.text = inputLabel.text! +  String(sender.tag)
            numberOne = Double(inputLabel.text!)!
        }
    }
    
   
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        
        if tag == 20 {
            print("tappet C Button clear All value.")
            operation = 0
            result = 0
            numberOne = 0
            numberTwo = 0
            inputLabel.text = String(result)
        }

        if tag != 15  && inputLabel.text != "" {  // sender.tag 15 -> =
            numberTwo = Double(inputLabel.text!)!
            firstNumberFlag = true
            operation = tag
        }
        if tag == 21  && inputLabel.text != ""{ // sender.tag 21 -> sqrt
            guard  let selectOperation = operateOne(rawValue: operation) else{return print("invalid transaction")}
            result = mathManager.operationsMath(operate: selectOperation, numberOne: numberOne)
            inputLabel.text = String(result)
            numberOne = result
        }
        
        else if tag == 15 {
            guard  let selectOperation = operations(rawValue: operation) else{return print("invalid transaction")}
            result = mathManager.operationsMath(operate: selectOperation, numberOne: numberTwo, numberTwo: numberOne)
            inputLabel.text = String(result)
            numberOne = result
        }
    }
}
