//
//  PopulateCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit

class PopulateCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopulateCollectionViewCell.self)
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionslabel: UILabel!

    func setUp(_ dish: PopulateDish){
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formatCalories
        descriptionslabel.text = dish.description
        
    }
    
    

}
