//
//  ThirdView.swift
//  Project2Flower
//
//  Created by Али  on 13.11.2022.
//

import UIKit
import SnapKit
class ThirdView: UITableViewController {
    
    var user: User!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        user = NetworkService.shared.getLoggedInUser()
        welcomeUser()
        setup()
        makeConstraints()
        // Do any additional setup after loading the view.
    }
    private var welcomeLbl: UITextView = {
        let text =  UITextView(frame: .zero)
        text.text = "Welcome"
        text.backgroundColor = .systemYellow
        return text
    }()
    
    
    
    
//    private var tableCollection: UICollectionView {
//        let table = UICollectionView(frame: .zero)
////        table.text = "Welcome"
//        table.backgroundColor = .red
//        return table
//    }()
    
    private func welcomeUser() {
        welcomeLbl.text = "Hello, \(user?.firstName) \(user?.lastName)"
    }
    func setup() {
//        view.addSubview(welcomeUser())
        view.addSubview(welcomeLbl)
//        view.addSubview(tableCollection)
        
    }
    
    func makeConstraints() {
        welcomeLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().inset(90)
            make.trailing.equalToSuperview().inset(90)
            make.top.equalToSuperview().inset(300)
            make.bottom.equalToSuperview().inset(300)
        }
//        tableCollection.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.leading.equalToSuperview().inset(90)
//        }
    }
    
}


//
//  TabBarViewController.swift
//  Project2Flower
//
//  Created by Али  on 16.11.2022.
//

//import SnapKit


    
    
    
//
//    class HomeVC: UIViewController {
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            view.backgroundColor = .lightGray
//
//        }
//    }
//
//    class FavoriteVC: UIViewController {
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            view.backgroundColor = .blue
//
//
//        }
//    }
//
//    class NotifyVC: UIViewController {
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            view.backgroundColor = .red
//
//        }
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */






