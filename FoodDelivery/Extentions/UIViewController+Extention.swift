//
//  UIViewController+Extention.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//


import UIKit

extension UIViewController{
    
    
    static var identifier : String{
        
        return String(describing: self)
    }
    
    //This function help us to initialize any controller..
    
    static func instantiate() -> Self {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyBoard.instantiateViewController(withIdentifier: identifier) as! Self
        
    }
    
    
}
