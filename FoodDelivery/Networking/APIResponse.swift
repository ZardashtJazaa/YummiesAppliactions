//
//  APIResponse.swift
//  FoodDelivery
//
//  Created by Zardasht  on 25/06/2022.
//

import Foundation

struct APIResponse<T:Codable> : Codable {
    
    let status: Int
    let message: String?
    let error: String?
    let data : T?
    
}
