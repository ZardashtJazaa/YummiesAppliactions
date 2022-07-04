//
//  DishListTableViewCell.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: DishListTableViewCell.self)
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    
    
    func setUp(_ dish: PopulateDish){
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text  = dish.name
        descriptionsLabel.text = dish.description
        
    }
    
    func setUp(_ order: Orders) {
        
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLabel.text  = order.dish?.name
        descriptionsLabel.text = order.name
        
    }
    
}
