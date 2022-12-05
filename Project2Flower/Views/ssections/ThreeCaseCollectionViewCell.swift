//
//  ThreeCaseCollectionViewCell.swift
//  Project2Flower
//
//  Created by Али  on 29.11.2022.
//

import UIKit
import SnapKit
class ThreeCaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "ThreeCaseCollectionViewCell"

    
    lazy  var flower1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flower1.png")
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true

        return imageView
    }()
    
    lazy var nameOfSections: UILabel = {
        let label = UILabel()
        label.text = " Flower"
        label.textColor = .black
        //        label.layer.masksToBounds = true

        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(flower1)
        contentView.addSubview(nameOfSections)
        setupContraints()
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .red
    }
    
    
    override var isHighlighted: Bool {
        didSet {
            nameOfSections.textColor = isHighlighted ? UIColor.lightGray : .label
            contentView.backgroundColor = isHighlighted ? UIColor.lightGray : .lightGray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            nameOfSections.textColor = isSelected ? UIColor.lightGray : .label
            contentView.backgroundColor = isSelected ? UIColor.blue : .blue
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupContraints() {
        flower1.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.bottom.equalToSuperview().inset(30)
//            make.width.equalTo(70)
//            make.height.equalTo(70)
        }
        nameOfSections.snp.makeConstraints { make in
            make.top.equalTo(flower1.snp.bottom)
            make.leading.trailing.equalTo(30)
        }
    }
}

