//
//  Route.swift
//  FoodDelivery
//
//  Created by Zardasht  on 25/06/2022.
//

import Foundation
enum Route: Codable {
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllDishes
    case placeOrder(String)
    case categoryDishList(String)
    case fetchAllOrders
    
    var descriptions: String{
        
        switch self{
            
        case .fetchAllDishes:
            return "/dish-categories"
        case .placeOrder(let orderID): return "/orders/\(orderID)"
            
        case .categoryDishList(let categoryID): return "/dishes/\(categoryID)"
            
        case .fetchAllOrders: return "/orders"
            
        }
    }
}
