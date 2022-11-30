//
//  CollectionTableViewCell.swift
//  Project2Flower
//
//  Created by Али  on 23.11.2022.
//

import UIKit
import SnapKit

class CollectionTableViewCell: UITableViewCell {
    
    lazy private var collectionViewCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.collectionViewCell)
        collectionView.backgroundColor = .clear
//        collectionView.backgroundColor = .purple
//        collectionView.layer.cornerRadius = 40
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        contentView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
//         UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)

        
        
 
        
        collectionViewCell.delegate = self
        collectionViewCell.dataSource = self
        
        setup()
        makeConstraints()
    }
    required init?(coder:NSCoder) {
        fatalError("init(coder has not been implemented")
    }
    func setup() {
        contentView.addSubview(collectionViewCell)
    }
    func makeConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.equalToSuperview().offset(-30)
            
//            make.leading.trailing.equalToSuperview().inset(30)
        }
        collectionViewCell.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(5)

        }
        
    }
}


extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.collectionViewCell, for: indexPath) as! CollectionViewCell
        return cell
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate {
    
}


