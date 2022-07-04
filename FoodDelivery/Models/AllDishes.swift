//
//  AllDishes.swift
//  FoodDelivery
//
//  Created by Zardasht  on 25/06/2022.
//

import Foundation

struct AllDishes: Codable {
    
    
    let categories : [DishCategory]?
    let populars:  [PopulateDish]?
    let specials: [PopulateDish]?
    
}
