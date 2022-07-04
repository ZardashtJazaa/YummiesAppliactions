//
//  UIView+Extentions.swift
//  FoodDelivery
//
//  Created by Zardasht  on 22/06/2022.
//

import Foundation
import UIKit

extension UIView{
     //inspectable make the propery appear.
    @IBInspectable var cornerRadius: CGFloat{
        
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
        
    }
    
    
}
