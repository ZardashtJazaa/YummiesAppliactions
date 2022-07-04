//
//  OnboardingViewController.swift
//  FoodDelivery
//
//  Created by Zardasht  on 22/06/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionsView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides : [OnboardingSlides] = []
    
    //MARK: CurrentPage Variable
    
    private var currentPage = 0 {
        
       
        didSet{
            pageController.currentPage = currentPage
            if currentPage == slides.count - 1{
               
                self.nextButton.setTitle("Get Started", for: .normal)
            
            }else{
                self.nextButton.setTitle("Next", for: .normal)
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        slides = [
            OnboardingSlides(title: "Delicios Dishes",
                             descriptions: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlides(title: "World-Class Chefs", descriptions: "Our dishes are prepared only by the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlides(title: "Instant World-Wide Delivery", descriptions: "Your orders will be delivered instantly irrespective of your locations around the world.", image: #imageLiteral(resourceName: "slide3") )
        ]
        pageController.numberOfPages = slides.count
        
    }
    
    //MARK: nextButton
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if currentPage != slides.count - 1 {
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionsView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          
        }else{
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            //let controller = UINavigationController.instantiate()
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            
            UserDefaults.standard.hasOnboarded = true
            
            present(controller, animated: true, completion: nil)
        }
        
    }
    
}


//MARK: Slides Views


extension OnboardingViewController: UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier , for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setUp(slides[indexPath.row])
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionsView.frame.width, height: collectionView.frame.height)
        
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        				
        
        
    }
    
}
