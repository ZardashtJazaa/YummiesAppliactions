//
//  CategoryCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self) // make that as String!.
    
    func setUp(_ category: DishCategory){
        
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        
    }
}
