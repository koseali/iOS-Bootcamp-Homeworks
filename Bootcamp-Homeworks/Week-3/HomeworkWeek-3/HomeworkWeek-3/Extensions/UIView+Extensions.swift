//
//  UIView+Extensions.swift
//  HomeworkWeek-3
//
//  Created by Ali Kose on 17.09.2021.
//

import UIKit

extension UIView{
    
    @IBInspectable
     var cornerRadius : CGFloat{
         get { return self.cornerRadius}
         set { self.layer.cornerRadius = newValue}
     }
    
    @IBInspectable var isRounded : Bool {
           set {
               let radius = newValue ? self.frame.height/2 : 0
               self.layer.cornerRadius = radius
           }
           get {
               return self.isRounded
           }
       }
}
