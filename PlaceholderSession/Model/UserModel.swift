//
//  UsersModel.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/6/23.
//

import Foundation

struct UserModel: Decodable {
    let id: Int
    let name, username, email: String
    let address: AddressModel
    let phone, website: String
    let company: CompanyModel
}
