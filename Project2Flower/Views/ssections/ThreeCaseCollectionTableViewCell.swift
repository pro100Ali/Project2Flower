//
//  3CaseCollectionTableViewCell.swift
//  Project2Flower
//
//  Created by Али  on 29.11.2022.
//

import UIKit
import SnapKit

class ThreeCaseCollectionTableViewCell: UITableViewCell {
    var arrayImages = ["flower4.png", "flower5.png",  "flower3.png"]
    
    var arrayNames = ["Plants", "Flowers",  "Richones"]
    lazy private var collectionViewCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
        //        la.layer.cornerRadius = 0.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ThreeCaseCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.threeCaseCollectionViewCell)
        collectionView.backgroundColor = .clear
        //        collectionView.backgroundColor = .yellow
        collectionView.isScrollEnabled = false
        collectionView.layer.cornerRadius = 40
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 243/255, green: 242/255, blue: 242/255, alpha: 1)
        //        contentView.backgroundColor = .blue
        
        collectionViewCell.dataSource = self
        collectionViewCell.delegate = self
        
        contentView.addSubview(collectionViewCell)
        setupConstraints()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = arrayImages[indexPath.item]
        print(data)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ThreeCaseCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.threeCaseCollectionViewCell, for: indexPath) as! ThreeCaseCollectionViewCell
        
        cell.flower1.image = UIImage(named: arrayImages[indexPath.row])
        
        cell.layer.cornerRadius = 50
        
        
        return cell
    }
    
    
    func setup() {
        contentView.addSubview(collectionViewCell)
    }
    
    func setupConstraints() {
        
        collectionViewCell.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(7)
            make.top.bottom.equalToSuperview()
            
        }
        
        
        
    }
}


extension ThreeCaseCollectionTableViewCell: UICollectionViewDelegate {
    
}
