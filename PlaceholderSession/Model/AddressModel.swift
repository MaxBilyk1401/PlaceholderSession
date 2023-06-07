//
//  AddressModel.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/7/23.
//

import Foundation

struct AddressModel: Decodable {
    let street, suite, city, zipcode: String
    let geo: GeolocationModel
}
