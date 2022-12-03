//
//  ViewController.swift
//  Project2Flower
//
//  Created by Али  on 07.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    


    lazy private var tableView: UITableView = {
        var table = UITableView(frame: .zero)
        table.backgroundColor = .tintColor
        
        
        return table
    }()
    
    private var button: UIButton {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemGreen
        button.setTitle("Get started", for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-Bold", size: 15)
        self.view.addSubview(button)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didButton(_ : )), for: .touchUpInside)
        self.view.addSubview(button)
//        button.isHovered = true
    
        return button
    }
    
    
    @objc private func didButton(_ : UIButton) {
   
        let newViewController = SecondView()
        self.navigationController?.pushViewController(newViewController, animated: true)

    }

    
    lazy private var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back.png")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy private var textLabel: UITextView = {
        let text = UITextView(frame: .zero)
        text.text = "Magical Things"
        text.backgroundColor = .clear
        text.textColor = .black
        text.font = UIFont(name: "Futura-Bold", size: 50)
    
        return text
    }()

 
    lazy private var textLabel2: UITextView = {
        let text = UITextView(frame: .zero)
        text.text = "Magical ThingsMagicalrrrw"
        text.backgroundColor = .clear
        text.font = UIFont(name: "Futura-Bold", size: 12)
        text.textColor = .systemGray

//        text.font = UIFont(
        return text
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .tintColor
        self.parent?.navigationItem.setHidesBackButton(true, animated: false)

        setupViews()
        setupConstraints()

    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(imageView)
//        view.addSubview(button)
        view.addSubview(textLabel)
        view.addSubview(textLabel2)
    }
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            //            make.center.equalToSuperview()
            //            make.height.equalTo(130)
            //            make.width.equalTo(90)
            make.top.equalToSuperview().offset(560)
            make.bottom.equalToSuperview().inset(125)
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(110)
            //            make.leading.equalTo(30)
            //            make.height.equalTo(30)
            //            make.width.equalTo(140)
            
            
        }
        textLabel2.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).inset(33)
            make.bottom.equalToSuperview().inset(125)
            make.leading.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(150)
            
        }
        button.snp.makeConstraints { make in
            make.width.equalTo(110)
            make.height.equalTo(40)
            make.top.equalTo(textLabel2.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(50)
        }
        
        
    }

}



