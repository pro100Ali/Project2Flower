//
//  TabBarViewController.swift
//  Project2Flower
//
//  Created by Али  on 16.11.2022.
//

import UIKit
//import SnapKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: FavoriteVC())
        let vc3 = UINavigationController(rootViewController: HomeVC())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "eraser")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3], animated: true)
        
        
        
        
    }
}
    
    
    

    class HomeVC: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .lightGray

        }
    }

    class FavoriteVC: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white


        }
    }

    class NotifyVC: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .red

        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




