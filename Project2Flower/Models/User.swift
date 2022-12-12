//
//  User.swift
//  Project2Flower
//
//  Created by Али  on 13.11.2022.
//

import Foundation

struct User {
    let firstName, lastName, email: String
    let age: Int
    let Location: Location
    init(firstName: String, lastName: String, email: String, age: Int, Location: Location) {
        self.firstName = "Ali123"
        self.lastName = "Aibolatov123"
        self.email = "200103479@stu.sdu.edu.kz"
        self.age = 20
        self.Location = Location
    }
}

struct Location {
    let lat: Double
    let lng: Double
}
