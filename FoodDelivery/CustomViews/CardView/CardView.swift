//
//  CardView.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit

class CardView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10
        cornerRadius = 10  // this is a view already so we just say that..default corner radius for each view..
        
        
    }
    
    
}
