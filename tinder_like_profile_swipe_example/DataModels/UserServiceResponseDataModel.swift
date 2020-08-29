//
//  UserServiceResponseDataModel.swift
//  statusneo_project
//
//  Created by arpit sharma on 21/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation
//
//  UserServiceResponseModel.swift
//  statusneo_project
//
//  Created by arpit sharma on 18/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

// MARK: - UserServiceResponseModel
class UserServiceResponseDataModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let user: User
    let seed, version: String
}

// MARK: - User
struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email, username, password, salt: String
    let md5, sha1, sha256, registered: String
    let dob, phone, cell, ssn: String
    let picture: String

    enum CodingKeys: String, CodingKey {
        case gender, name, location, email, username, password, salt, md5, sha1, sha256, registered, dob, phone, cell
        case ssn = "SSN"
        case picture
    }
}

// MARK: - Location
struct Location: Codable {
    let street, city, state, zip: String
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}
