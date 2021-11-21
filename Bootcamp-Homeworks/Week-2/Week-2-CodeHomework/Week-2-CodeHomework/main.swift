//
//  main.swift
//  Week-2-CodeHomework
//
//  Created by Ali Kose on 10.09.2021.
//

import Foundation



/**
 Function that calculates Fibonacci numbers according to minimum and maximum values.
 
 - Parameters:
 - min: bind to  min fibonacci numbers
 - max:  bind to  max fibonacci numbers
 */
func findFibonacciNumbers(min : Int, max : Int){
    var fibonacciList = [1,1]
    var index = 0
    var listMax = fibonacciList[index]
    
    guard !(min >= max) else {
        return print("Minumum Deger Maksimum Degere Esit ya da Buyuk Olamaz.")
    }

  
    while listMax <= max {
        
        let temp = fibonacciList[index] + fibonacciList[index+1]
        
        if temp <= max {
            fibonacciList.append(temp)
            listMax = temp
            index += 1
        } else { break }
    }
    
    var result = String()
    for number in fibonacciList {
        if number >= min && number <= max {
            result = result +  String(number) + " "
        }
    }
    guard !result.isEmpty else {
        return print("Girilen Aralikta Gosterilecek Fibonacci sayisi bulunmamaktadir.")
    }
    print("\(min) - \(max) arasindaki Fibonacci Sayilari: \(result)")
    
}


/**
 Calculate 0-1000 fibonacci numbers and  show to 750-1000 fibonacci numbers.
 */
func findFibonacciNumbers(){
    var fibonacciList = [1,1]
    var index = 0
    var listMax = fibonacciList[index]
    
    while listMax <= 1000 {
        
        let temp = fibonacciList[index] + fibonacciList[index+1]
        
        if temp <= 1000 {
            fibonacciList.append(temp)
            listMax = temp
            index += 1
        } else { break }
    }
    
    var result = String()
    for number in fibonacciList {
        if number >= 750 && number <= 1000 {
            result = result +  String(number) + " "
        }
    }
    print("750-1000 arasindaki Fibonacci Sayilari: \(result)")
}

findFibonacciNumbers(min: 0,max: 1000)

findFibonacciNumbers()

