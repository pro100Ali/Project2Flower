//
//  PageSlider.swift
//  Project2Flower
//
//  Created by Али  on 29.11.2022.
//

import UIKit
import SnapKit
class PageSlider: UITableViewCell {

    
    var arrayImages = ["back.png", "plants.png",  "back2.png","back.png", "plants.png",  "back2.png"]

    lazy private var collectionViewCell: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 250)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PageSliderViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.pageSlider)
//        collectionView.backgroundColor = .clear
        
        collectionView.backgroundColor = .purple
        collectionView.layer.cornerRadius = 20
        collectionView.showsHorizontalScrollIndicator = false
       
        return collectionView
    }()

    
     
     lazy private var pageController: UIPageControl = {
         let pageControl = UIPageControl()
         pageControl.numberOfPages = 5

         return pageControl
     }()

     
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        
//         UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)

        
        pageController.numberOfPages = arrayImages.count
        
        
        collectionViewCell.delegate = self
        collectionViewCell.dataSource = self
        
        setup()
        makeConstraints()
        
        startTimer()
    }
    required init?(coder:NSCoder) {
        fatalError("init(coder has not been implemented")
    }
    var timer : Timer?
    var currentCellIndex = 0
    
    @objc func moveToNextIndex() {
        
        if currentCellIndex < arrayImages.count - 1 {
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        
        
        collectionViewCell.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)

//        pageController.currentPage = currentCellIndex
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    
   
    
    
    
    func setup() {
        contentView.addSubview(collectionViewCell)
        contentView.addSubview(pageController)
    }
    func makeConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionViewCell.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
//        pageController.snp.makeConstraints { make in
//            make.bottom.centerX.equalToSuperview()
//        }
    }
}


extension PageSlider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.pageSlider, for: indexPath) as! PageSliderViewCell
        
        cell.pageSlider.image = UIImage(named: arrayImages[indexPath.row])
//        for i in indexPath {
//            cell.pageSlider.image = UIImage(named: arrayImages[i])
//        }
        return cell
    }
    
    
}

extension PageSlider: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



