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
        label.text = "now"
        return label
    }()
    lazy private var price: UILabel = {
        let label = UILabel()
        label.text = " 58$"
        //        label.layer.masksToBounds = true
        
        return label
    }()
    
    
    lazy private var conditionImageView: UIImageView = {
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
    lazy private var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemGreen
        button.setTitle("Get started", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 10)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        //        button.isHovered = true
        
        return button
    }()
    
    
    
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
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.top.equalToSuperview().inset(10)
        }
        conditionImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(35)
            make.top.bottom.equalToSuperview().inset(25)
        }
        price.snp.makeConstraints { make in
            make.top.equalTo(conditionImageView.snp.bottom)
        }
        button.snp.makeConstraints{ make in
            make.top.equalTo(conditionImageView.snp.bottom).offset(2)
            make.leading.equalTo(price.snp.trailing).inset(30)
        }
        foodLikeButton.snp.makeConstraints { make in
        }
        
    }
    func setup() {
        contentView.addSubview(conditionImageView)
        contentView.addSubview(price)
        contentView.addSubview(button)
        contentView.addSubview(foodLikeButton)
    }
}
