//
//  OnboardingCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Zardasht  on 22/06/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitlelabel: UILabel!
    @IBOutlet weak var slideDescriptionsLabel: UILabel!
    
    func setUp(_ slide: OnboardingSlides){
        
        slideImageView.image = slide.image
        slideTitlelabel.text = slide.title
        slideDescriptionsLabel.text = slide.descriptions
        
    }
    
}
