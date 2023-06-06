//
//  UsersModel.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/6/23.
//

import Foundation

struct UsersModel: Decodable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Decodable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat, lng: String
}

struct Company: Decodable {
    let name, catchPhrase, bs: String
}
