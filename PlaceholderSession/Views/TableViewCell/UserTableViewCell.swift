//
//  UserTableViewCell.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/7/23.
//

import UIKit

final class UserTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var websiteLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    private var list = [UserModel]()
    
    func setup(with user: UserModel) {
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        companyLabel.text = user.company.name
        addressLabel.text = user.address.city
    }
}
