//
//  CollectionViewCell.swift
//  practiceSnapkit
//
//  Created by Али  on 20.11.2022.
//

import UIKit
import SnapKit
class CollectionViewCell: UICollectionViewCell {
    
  
    static let identifier = "CollectionViewCell"
    
    private var textLabel: UITextView = {
        let text = UITextView()
        text.text = "text"
        
        return text
    }()
    
    lazy private var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Aloe plant"
        return label
    }()
    lazy private var price: UILabel = {
        let label = UILabel()
        label.text = " 58$"
        //        label.layer.masksToBounds = true
        
        return label
    }()
    
    
    lazy  var conditionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flower3.png")
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        //        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
//    lazy private var button: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.backgroundColor = .systemGreen
//        button.setTitle("Get started", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 10)
//        button.layer.cornerRadius = 10
//        button.layer.masksToBounds = true
//
//        //        button.isHovered = true
//
//        return button
//    }()
    
    
    
    var count = 0
    
    
    
    lazy private var foodLikeButton: UIButton = {
        let bt = UIButton()
        let imageIcon = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        bt.setImage(imageIcon, for:.normal)
        
        bt.addTarget(self, action: #selector(likeButtonChanged), for:.touchUpInside)
        return bt
        
    }()

    @objc func likeButtonChanged() {
        if foodLikeButton.isTouchInside {
            count += 1
        }
        if count % 2 == 0 {
            let imageIcon = UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            
            foodLikeButton.setImage(imageIcon, for:.normal)
            
        } else {
            let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            foodLikeButton.setImage(imageIcon, for: .normal)
            
        }
        
    }
    
    
    //    override var isHighlighted: Bool{
    //        didSet {
    //            print(123)
    //        }
    //    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(3)
            make.bottom.equalToSuperview().inset(50)
            make.top.equalToSuperview()
        }
        conditionImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(80)
            
        }
        price.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom).offset(2)
        }
        timeLabel.snp.makeConstraints{ make in
            make.top.equalTo(conditionImageView.snp.bottom).offset(30)
            make.leading.equalTo(price.snp.trailing).inset(30)
        }
        foodLikeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
           
        }
        
    }
    func setup() {
        contentView.addSubview(conditionImageView)
        contentView.addSubview(price)
        contentView.addSubview(timeLabel)
        contentView.addSubview(foodLikeButton)
    }
}
