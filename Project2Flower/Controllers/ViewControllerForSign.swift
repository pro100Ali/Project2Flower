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
import FirebaseDatabase

class ViewControllerForSign: UIViewController {
    static let shared = ViewControllerForSign()
    //    var user: User!
    //    var hello = [NetworkService]()
    
    
    //  	  var newVariable = emailField.text
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        //        label.text = "Login"
        label.font = .systemFont(ofSize: 35)
        //        label.font = .systemFontSize(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.attributedText = NSAttributedString(string: "", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        emailField.placeholder = " Email adress"
//        emailField.attributedPlaceholder = label
//        NSAttributedString(string: "My Placeholder",
//    attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        emailField.layer.cornerRadius = 10

        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = " Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.cgColor
        passwordField.layer.cornerRadius = 10

        return passwordField
    }()
    
    
    private let name: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = " Name"
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.black.cgColor
        passwordField.layer.cornerRadius = 10
        passwordField.isHidden = true

        return passwordField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10

        return button
    }()
    
    
    lazy var segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        //        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .red
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleLoginRegisterChange),
                     for: .valueChanged)
        return sc
    }()
    
    @objc func handleLoginRegisterChange() {
        let title = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
        button.setTitle(title, for: .normal)
        print(segmentControl.selectedSegmentIndex)
        //        name.isHidden = true
        //        name.active = false
        switch segmentControl.selectedSegmentIndex {
        case 0:
//            print(0)
//            setupConstraints()
            name.isHidden = true
    case 1:
//            setupConstraints2()
            name.isHidden = false
    default:
            setupConstraints()
            name.isHidden = false
    }

        //        name.active = true
    }
    
    lazy private var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "back.png")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        view.backgroundColor = UIImage(named: "back.png")
        button.addTarget(self, action: #selector(handleRegisterOrLogin), for: .touchUpInside)
        setupConstraints()
        
        
    }
    private let alteke: UITextView = {
        let label = UITextView()
        //        label.text = user?.firstName
        return label
    }()
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //
        //        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        //        emailField.frame = CGRect(x: 20,
        //                                  y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        //        passwordField.frame = CGRect(x: 20,
        //                                     y: emailField.frame.origin.y+emailField.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        //        button.frame = CGRect(x: 20,
        //                              y: passwordField.frame.origin.y+passwordField.frame.size.height+30, width: view.frame.size.width-40, height: 52)
        //
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
        
    }
    
    
    
    
    func setup() {
        view.addSubview(imageView)

        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.addSubview(name)
        view.addSubview(segmentControl)
    }
    
    func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            //            make.top.equalToSuperview()
            make.centerY.equalTo(400)
        }
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).inset(170)
            make.leading.trailing.equalToSuperview().inset(30)
            
        }
        name.snp.makeConstraints { make in
            //            make.top.equalTo(passwordField.snp.bottom).multipliedBy(1.05)
            //            make.centerX.equalTo(passwordField.snp.centerX)
            //            make.leading.trailing.equalTo(passwordField)
            //            make.height.equalTo(passwordField)
            
            make.top.equalTo(segmentControl.snp.bottom).multipliedBy(1.1)
            make.centerX.equalTo(segmentControl.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(55)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).multipliedBy(1.04)
            make.centerX.equalTo(name.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(55)
        }
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).multipliedBy(1.035)
            make.centerX.equalTo(emailField.snp.centerX)
            make.leading.trailing.equalTo(emailField)
            make.height.equalTo(emailField)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).multipliedBy(1.05)
            make.centerX.equalTo(passwordField.snp.centerX)
            make.leading.trailing.equalTo(passwordField)
            make.height.equalTo(passwordField)
            
        }
        
        
    }
    
    
    
    @objc private func didTapButton(){
        print("contin")
        guard let email = emailField.text,!email.isEmpty,
              let password = passwordField.text, !password.isEmpty else{
            print("missingField")
            return
        }
        
        
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] FirebaseAuth,error in
            

            let ref = Database.database().reference(fromURL: "https://project2flower-default-rtdb.firebaseio.com/")
            
            //            FirebaseDatabase.database().reference(fromURL: "https://project2flower-default-rtdb.firebaseio.com/")
            
            //            let uid: String = (Auth.auth().currentUser?.uid)!
            //            Database.database().reference().child(uid).setValue("users")
            ref.child("users").child((Auth.auth().currentUser?.uid)!).setValue(["username": password, "email":email])
            
            //            let userReference = ref.child("users").child(Auth.auth().currentUser!.uid)
            //            let usersReference = self.ref.child("users")
            //            let childRef = usersReference.child("uid_0")
            
            
            //            childRef.setValue(dictToSave)
            //            .child(user!.user.uid)
            //            self.ref.child("users").child(user.uid).setValue(["username": username])
            
            let values = ["password": password, "email": email]
            ref.updateChildValues(values, withCompletionBlock: { (err,ref) in
                
                if err != nil {
                    print(err)
                    return
                }
                
                print("Saved user succecfully")
                
            })
            
            
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            print("you have signed in)")
            
//            strongSelf.label.isHidden = true
//            strongSelf.emailField.isHidden = true
//            strongSelf.passwordField.isHidden = true
//            strongSelf.button.isHidden = true
            
            
            
        })
        
    }
    
    @objc func handleRegisterOrLogin() {
        if segmentControl.selectedSegmentIndex == 0 {
            handleLogin()
        }
        else{
            didTapButton()
        }
    }
    
    
    func handleLogin() {
        
        guard let email = emailField.text,
                let password = passwordField.text else {
            print("Form is not valid")
            return
        }
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] FirebaseAuth,error in
                if error != nil {
                    print("This user doesn't exists \(error)")
                    
                    return
                }
                
                
                self?.dismiss(animated: true, completion: nil)
                print("Signed in")
                let newViewController = TabBarViewController()
                self?.navigationController?.pushViewController(newViewController, animated: true)
                
    })
                                            
}
    
    
    
    
    
    
    
    
    
    //        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result,error in
    //            guard let strongSelf = self else {
    //                return
    //            }
    //            guard error == nil else{
    //                strongSelf.showCreateAccount(email: email, password: password)
    //                return
    //            }
    //            print("you have signed in)")
    //            strongSelf.label.isHidden = true
    //            strongSelf.emailField.isHidden = true
    //            strongSelf.passwordField.isHidden = true
    //            strongSelf.button.isHidden = true
    //        })
    
    //    }
    
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
                
                self?.navigationController?.pushViewController(ViewControllerForSign(), animated: true)
//                strongSelf.label.isHidden = true
//                strongSelf.emailField.isHidden = true
//                strongSelf.passwordField.isHidden = true
//                strongSelf.button.isHidden = true
//
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: {_ in }))
        
        present(alert,animated: true)
    }
    
    
    
    
    func setupConstraints2() {
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            //            make.top.equalToSuperview()
            make.centerY.equalTo(400)
        }
        segmentControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.top.equalTo(label.snp.bottom).inset(150)
//            make.leading.trailing.equalToSuperview().inset(30)
//            make.height.equalTo(100)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).multipliedBy(1.04)
            make.centerX.equalTo(segmentControl.snp.centerX)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(55)
        }
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).multipliedBy(1.035)
            make.centerX.equalTo(emailField.snp.centerX)
            make.leading.trailing.equalTo(emailField)
            make.height.equalTo(emailField)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).multipliedBy(1.05)
            make.centerX.equalTo(passwordField.snp.centerX)
            make.leading.trailing.equalTo(passwordField)
            make.height.equalTo(passwordField)
            
        }
        name.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).multipliedBy(1.05)
            make.centerX.equalTo(button.snp.centerX)
            make.leading.trailing.equalTo(passwordField)
            make.height.equalTo(button)
            
//            make.centerX.equalTo(1290)
//            make.centerY.equalTo(1290)
        }
        
        
    }
}
