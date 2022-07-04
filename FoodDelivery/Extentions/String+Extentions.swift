//
//  String+Extentions.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import Foundation

extension String{
    //This computed property help us to convert any URL String to actual URL.
    var asUrl : URL? {
        return URL(string : self)
    }
}
