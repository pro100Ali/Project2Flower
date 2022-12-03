//
//  MainViewController.swift
//  Project2Flower
//
//  Created by Али  on 23.11.2022.
//

import UIKit
import SnapKit
class MainViewController: ViewController {
    
    lazy private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.layer.cornerRadius = 40
        table.separatorStyle = .none
        table.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
//        view.backgroundColor = .red

        return table
    }()
    
    
    
    override func viewDidLoad() {
        
//        weatherManager.delegate = weatherTableView.tableHeaderView as! any WeatherManagerDelegate

        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .green
//        UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        view.addSubview(tableView)
        setupConstraints()
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        tableView.tableHeaderView = headerView
        self.parent?.navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.backButtonDisplayMode = .minimal
        viewWillAppear(true)
        view.insetsLayoutMarginsFromSafeArea = true
        
    }
    
    
    
    override func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    
}
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: let cell = ThreeCaseCollectionTableViewCell()
            return cell
//            cell.backgroundColor = .clear
        case 1: let cell = PageSlider()
//            cell.backgroundColor = .clear
            return cell
        case 2: let cell = CollectionTableViewCell()
//            cell.backgroundColor = .clear
            return cell

        default:
            return UITableViewCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
}


extension MainViewController : UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 200
        default:
            return 700
        }
    }
    
    
}
 
