//
//  HeaderView.swift
//  Project2Flower
//
//  Created by Али  on 23.11.2022.
//

import UIKit
import SnapKit


final class HeaderView: UIView {

    private var searchBar:  UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        searchBar.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1).cgColor
        searchBar.layer.borderWidth = 1
        
//        searchBar.backgroundColor = .red
        searchBar.searchTextField.backgroundColor = .white

        return searchBar
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

  
//    private func addGradient(){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor.clear.cgColor,
//            UIColor.systemBackground.cgColor
//            ]
//        gradientLayer.frame = bounds
//        layer.addSublayer(gradientLayer)
//
//
//    }
}


extension HeaderView {
    
    func setupViews() {
        addSubview(searchBar)
    }
    
    func setupConstraints() {
        searchBar.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
//            make.top.bottom.equalToSuperview()
//            make.top.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().inset(30)
//            make.bottom.top.equalToSuperview().inset(10)
        }
    }
}
