//
//  ViewControllerForSign.swift
//  Project2Flower
//
//  Created by Али  on 30.11.2022.
//

import UIKit
import SnapKit
//import Firebase
import FirebaseAuth

class ViewControllerForSign: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Login"
        label.font = .systemFont(ofSize: 35)
        //        label.font = .systemFontSize(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email adress"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.cgColor
        return passwordField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        //        label.font = .systemFontSize(ofSize: 24, weight: .semibold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        setupConstraints()
        view.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        //
        //        emailField.frame = CGRect(x: 20, y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        //
        //        passwordField.frame = CGRect(x: 20, y: emailField.frame.origin.y+emailField.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        //
        //        button.frame = CGRect(x: 20, y: passwordField.frame.origin.y+passwordField.frame.size.height+10, width: view.frame.size.width-40, height: 80)
        
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        emailField.frame = CGRect(x: 20,
        y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        passwordField.frame = CGRect(x: 20,
        y: emailField.frame.origin.y+emailField.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        button.frame = CGRect(x: 20,
        y: passwordField.frame.origin.y+passwordField.frame.size.height+30, width: view.frame.size.width-40, height: 52)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    //
    
    
    
    func setup() {
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
    }
    
    func setupConstraints() {
        label.snp.makeConstraints { make in
            //            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerY.equalTo(290)
        }
        emailField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).multipliedBy(1.1)
            make.centerX.equalTo(label.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(60)
            make.height.equalTo(45)
            //            make.top.bottom.equalToSuperview().inset(410)
        }
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).multipliedBy(1.05)
            make.centerX.equalTo(emailField.snp.centerX)
            make.leading.trailing.equalTo(emailField)
            make.height.equalTo(emailField)
            
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).multipliedBy(1.05)
            make.centerX.equalTo(passwordField.snp.centerX)
            
        }
    }
    
    
    
    @objc private func didTapButton(){
        print("contin")
        guard let email = emailField.text,!email.isEmpty,
              let password = passwordField.text, !password.isEmpty else{
            print("missingField")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result,error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            print("you have signed in")
            strongSelf.label.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.button.isHidden = true
        })
        
    }
    
    func showCreateAccount(email:String,password:String ) {
        
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password,completion: { [weak self] result,error in
                guard let strongSelf = self else{
                    return
                }
                guard error == nil else {
                    strongSelf.showCreateAccount(email: email, password: password)
                    print("Account creation failed")
                    return
                }
                print("you have signed in")
//                self?.navigationController?.show(MainViewController(), sender: .none)
                
                self?.navigationController?.pushViewController(SecondView(), animated: true)
                strongSelf.label.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.button.isHidden = true
                
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: {_ in }))
        
        present(alert,animated: true)
    }
}
