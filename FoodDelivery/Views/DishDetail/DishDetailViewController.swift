//
//  DishDetailViewController.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit
import ProgressHUD
import IQKeyboardManagerSwift

class DishDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var nameFields: UITextField!
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var dishTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateDish()
        nameFields.delegate =  self
    }
    
     var dish : PopulateDish!
    
    private func populateDish(){
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        descriptionsLabel.text = dish.description
        dishTitle.text = dish.name
        caloriesLabel.text = dish.formatCalories
        
        
        
    }
    
    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {
        
        guard let name = nameFields.text?.trimmingCharacters(in: .whitespaces) ,!name.isEmpty else{
            ProgressHUD.showError("Please Enter your  name")
            return
        }
       
        
        ProgressHUD.show("Placing Order....")
        
        NetworkService.shared.placingOrder(dishID: dish.id ?? "", name: name) { result in
            switch result {
            case .success(_):
                ProgressHUD.colorAnimation = #colorLiteral(red: 0.3254901961, green: 0.7490196078, blue: 0.6156862745, alpha: 1)
                ProgressHUD.colorHUD = #colorLiteral(red: 0.9450980392, green: 0.9333333333, blue: 0.9137254902, alpha: 1)
                ProgressHUD.showSucceed("Your order has been received. 👩‍🍳")
              
               
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
                
            }
        }
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let name = textField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty {
           // print("Hello \(name)")
            IQKeyboardManager.shared.resignFirstResponder()
            
        }else{
            ProgressHUD.showError("Please Enter Your Name")
        }
       
        return true
    }
    
        
       
        
        
    
    
    

}
