//
//  SecondView.swift
//  Project2Flower
//
//  Created by Али  on 13.11.2022.
//

import UIKit
import SnapKit


class SecondView: UIViewController {
    
    lazy private var email: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray2
        text.placeholder = "ABCNM,V"
        text.layer.cornerRadius = 10
        text.autocapitalizationType = .none
        return text
    }()
    
    lazy private var login: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray2
        text.placeholder = "texx"
        text.isSecureTextEntry = true
        
        text.layer.cornerRadius = 10
        text.autocapitalizationType = .none
        
        
        return text
    }()
    
    lazy private var loginBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("login", for: .normal)
        button.isEnabled = false
        return button
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setup()
        setupConstraints()
        email.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        login.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        loginBtn.addTarget(self, action: #selector(self.onClickButton), for: .touchUpInside)
//        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.setLeftBarButtonItems(nil, animated: true)
          self.navigationItem.setHidesBackButton(true, animated:true)
        self.parent?.navigationItem.setHidesBackButton(true, animated: false)

    }
    
   
    
    @objc private func validateFields() {
        loginBtn.isEnabled = email.text != "" && email.text != ""
    }
    
    @objc func onClickButton() {
        NetworkService.shared.login(email: email.text!, password: login.text!) { success in
            if success {
                self.goToHomePage()
            } else {
                print("Invalid password")
            }
        }
    }
    func goToHomePage() {
        let newViewController = ViewControllerForSign()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func setup() {
        view.addSubview(email)
        view.addSubview(login)
        view.addSubview(loginBtn)
    }
    
    func setupConstraints() {
        email.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            //            make.center.equalToSuperview()
            make.top.equalToSuperview().inset(350)
            make.bottom.equalToSuperview().inset(460)
            //            make.height.equalTo(40)
            
        }
        login.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(42)
            //            make.center.equalToSuperview()
        }
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(login.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(150)
            make.height.equalTo(45)
        }
        //        login.snp.makeConstraints { make in
        //            make.edges.equalToSuperview()
        //
        //        }
    }
  

}
    class MyButton: UIButton {
        override var isEnabled: Bool {
            didSet {
                alpha = isEnabled ? 1.0 : 0.5
            }
        }
    }

