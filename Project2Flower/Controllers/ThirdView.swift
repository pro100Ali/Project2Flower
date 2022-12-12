//
//  ThirdView.swift
//  Project2Flower
//
//  Created by Али  on 13.11.2022.
//

import UIKit
import SnapKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class ThirdView: UITableViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        

        //            FirebaseDatabase.database().reference(fromURL: "https://project2flower-default-rtdb.firebaseio.com/")
        
//            let uid: String = (Auth.auth().currentUser?.uid)!
//            Database.database().reference().child(uid).setValue("users")

        
        user = NetworkService.shared.getLoggedInUser()
//        print(user)
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
//            table.text = "Welcome"
    //        table.backgroundColor = .red
    //        return table
    //    }()
    private func welcomeUser() {
        welcomeLbl.text = "Hello, \(user?.firstName) \(user?.lastName)"
    }
    func setup() {
        view.addSubview(welcomeLbl)
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
