//
//  PageSliderViewCell.swift
//  Project2Flower
//
//  Created by Али  on 29.11.2022.
//

import UIKit
import SnapKit

class PageSliderViewCell: UICollectionViewCell {
    static let identifier = "PageSliderViewCell"
    
    lazy  var pageSlider: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back.png")
        
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
        contentView.backgroundColor = .red

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        pageSlider.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.top.bottom.equalToSuperview().inset(20)
        }
        

    }
    func setup() {
        contentView.addSubview(pageSlider)
    }
    
}

