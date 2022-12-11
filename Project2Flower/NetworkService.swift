//
//  NewtworkService.swift
//  Project2Flower
//
//  Created by Али  on 13.11.2022.
//

import Foundation
import FirebaseAuth
//import FirebaseDatabaseSwif


class NetworkService {

    
    static let shared = NetworkService()
    func getLoggedInUser() -> User? {
        return user
    }
    private init() { }
    private var user: User?
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if email == "Ali" && password == "Ali" {
                    self.user = User(firstName: "Ali", lastName: "Aibolatov", email: "test@test.com", age: 20, Location: Location(lat: 2.32423, lng: -4.32234))
                    completion(true)
                } else {
                    self.user = nil
                    completion(false)
                }
            }
            
        }
        
    }
}
