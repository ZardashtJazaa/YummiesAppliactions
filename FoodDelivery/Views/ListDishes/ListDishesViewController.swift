//
//  ListDishesViewController.swift
//  FoodDelivery
//
//  Created by Zardasht  on 24/06/2022.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    var category : DishCategory!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dishes : [PopulateDish] =  []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.categoryDishList(categoryID: category.id ?? "") { result in
            
            switch  result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self.dishes = dishes
                self.tableView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells(){
        
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
    

}

extension ListDishesViewController: UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier , for: indexPath) as! DishListTableViewCell
        
        cell.setUp(dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
   
}
