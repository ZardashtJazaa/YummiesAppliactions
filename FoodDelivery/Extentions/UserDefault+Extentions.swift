//
//  UserDefault+Extentions.swift
//  FoodDelivery
//
//  Created by Zardasht  on 26/06/2022.
//

import Foundation

extension UserDefaults {
    
    //UserDefault store for presenting onboarding screen dependOn user already get started or not..
    
    private enum userDefaultsKeys:String {
        
        case hasOnboarded
        
    }
    
    var hasOnboarded: Bool {
       
        get{
            bool(forKey: userDefaultsKeys.hasOnboarded.rawValue)
            
        }
        set{
            set(newValue, forKey: userDefaultsKeys.hasOnboarded.rawValue)
            
        }
        
    }
    
}
