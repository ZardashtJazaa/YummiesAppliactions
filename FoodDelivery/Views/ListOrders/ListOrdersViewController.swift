//
//  ListOrdersViewController.swift
//  FoodDelivery
//
//  Created by Zardasht  on 24/06/2022.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var orders : [Orders] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        title = "Orders"
        registerCells()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkService.shared.fetchOrders { result in
            
            switch result {
            case .success(let order):
                
                ProgressHUD.dismiss()
                
                self.orders = order
                self.tableView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }
   

}

extension ListOrdersViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        
        cell.setUp(orders[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
}
