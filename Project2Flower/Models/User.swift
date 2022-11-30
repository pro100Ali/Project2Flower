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
}

struct Location {
    let lat: Double
    let lng: Double
}
