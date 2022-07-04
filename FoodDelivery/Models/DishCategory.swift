//
//  DishCategory.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import Foundation
struct DishCategory : Codable{
    
    let id , name , image : String?
    
    
   
    
    enum CodingKeys : String , CodingKey {
        
        case id
        case name = "title"  //means that look backend will send this "title" but i want you to decode that as my property .. 
        case image
        
    }
}
