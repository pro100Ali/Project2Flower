//
//  NewtworkService.swift
//  Project2Flower
//
//  Created by Али  on 13.11.2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


class NetworkService {

    
    static let shared = NetworkService()
    func getLoggedInUser() -> User? {
        return user
    }
    private init() { }
     var user: User?
//    var hello = User(firstName: "Altair", lastName: "Adebiatov", email: "test@alteke.ru", age: 19, Location: Location(lat: 2.32423, lng: -4.32234))
    
    let ref = Database.database().reference(fromURL: "https://project2flower-default-rtdb.firebaseio.com/")
    
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        //        ref.child("users").child((Auth.auth().currentUser?.uid)!).setValue(["username": password, "email":email])
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if email == "Ali" && password == "Ali" {
                    self.user = User(firstName: "Ali", lastName: "Aibolatov", email: "test@test.com", age: 20, Location: Location(lat: 2.32423, lng: -4.32234))
                    completion(true)
                } else {
                    self.user = User(firstName: "Altair", lastName: "Adebiatov", email: "test@alteke.ru", age: 19, Location: Location(lat: 2.32423, lng: -4.32234))
                    completion(false)
                }
            }
            
        }
        
    }
}
