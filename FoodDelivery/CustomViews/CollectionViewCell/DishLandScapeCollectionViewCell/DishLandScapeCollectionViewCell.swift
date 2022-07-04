//
//  DishLandScapeCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit

class DishLandScapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandScapeCollectionViewCell.self)
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setUp(_ dish: PopulateDish){
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formatCalories
    }
}
