//
//  Dish.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import Foundation

struct PopulateDish : Codable{
    
    let id : String?
    let name : String?
    let description : String?
    let image: String?
    let calories: Int?
    
    var formatCalories: String{
        
        return "\(calories ?? 0 ) calories"
        
    }
    
    
    
}
