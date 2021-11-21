//
//  CalculatorManager.swift
//  HomeworkWeek-3
//
//  Created by Ali Kose on 13.09.2021.
//

import Foundation
class CalculatorManager {
    
    static let shared = CalculatorManager() // using for access to  object method
    
    func operationsMath(operate : operations, numberOne : Double, numberTwo : Double) -> Double{
        
        switch operate {
        case .mod:
            let one = Int(numberOne)
            let two = Int(numberTwo)
            let value = Double(one % two)
            return value
        
        case .add:
            return numberOne+numberTwo
            
        case .substract:
            return numberOne-numberTwo
            
        case .divide:
            return numberOne/numberTwo
            
        case .multiply:
            
            return numberOne*numberTwo
            
        }
        
    }
    
    func operationsMath(operate: operateOne , numberOne : Double) -> Double {
        switch operate {
        case .square:
            return sqrt(numberOne)
                }
    }
}
