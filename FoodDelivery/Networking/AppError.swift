//
//  AppError.swift
//  FoodDelivery
//
//  Created by Zardasht  on 25/06/2022.
//

import Foundation

enum AppError: LocalizedError {
    
    case errorDecoding
    case Unknow
    case invalidURL
    case serverError(String)
    case NoData
    
    var errorDescriptions: String{
        switch self {
            
        case .errorDecoding:
            return "Response Could not be decoded"
        case .Unknow:
            return "Bruhh!!!! i have no idea what go on.."
        case .invalidURL:
            return "HEYY give me a valid URL"
        case .serverError(let error):
            return error
        case .NoData:
            return "No Data!"
        
        }
    
    }
    
}
