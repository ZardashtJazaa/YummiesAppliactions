//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Zardasht  on 23/06/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
   
    

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var LandScapeDisheCollectionView: UICollectionView!
    
    //MARK: categoriesArray
    
    var categories: [DishCategory] = []
    
    var popularDishes : [PopulateDish] = []
    
    var specials : [PopulateDish] =  []
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let netWork = NetworkService.shared
        ProgressHUD.show()
        netWork.fetchAllCategories  { result in
            
            switch result{
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self.categories = allDishes.categories ?? []
                
                self.popularDishes = allDishes.populars ?? []
                self.specials = allDishes.populars ?? []
               
                
                self.categoryCollectionView.reloadData()
                self.popularCollectionView.reloadData()
                self.LandScapeDisheCollectionView.reloadData()
                
            case .failure(let error):
               
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
        
        registerCells()
        
    }
    
    private func registerCells() {
        
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopulateCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopulateCollectionViewCell.identifier)
        
        LandScapeDisheCollectionView.register(UINib(nibName: DishLandScapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandScapeCollectionViewCell.identifier)
    }
    
}

//MARK: Extentions

extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDishes.count
        case LandScapeDisheCollectionView:
            return specials.count
        default:
            return 0
        }
            
    
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        switch collectionView{
            
        case categoryCollectionView:
            
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier , for: indexPath) as! CategoryCollectionViewCell
            
            cell.setUp(categories[indexPath.row])
            
            return cell
            
        case popularCollectionView:
            
            
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: PopulateCollectionViewCell.identifier , for: indexPath) as! PopulateCollectionViewCell
            
            cell.setUp(popularDishes[indexPath.row])
            
            return cell
            
        case LandScapeDisheCollectionView:
            
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier , for: indexPath) as! DishLandScapeCollectionViewCell
            
            cell.setUp(specials[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell() // an empty collectionsView
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if collectionView != categoryCollectionView{
            
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularDishes[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    
    }
    
        
}


