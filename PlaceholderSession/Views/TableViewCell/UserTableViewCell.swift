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
    
    var nameLabelText: String? {
        didSet {
            guard let nameLabel else { return }
            nameLabel.text = nameLabelText
        }
    }
    
    var usernameLabelText: String? {
        didSet {
            guard let usernameLabel else { return }
            usernameLabel.text = usernameLabelText
        }
    }
    
    var phoneLabelText: String? {
        didSet {
            guard let phoneLabel else { return }
            phoneLabel.text = phoneLabelText
        }
    }
    
    var websiteLabelText: String? {
        didSet {
            guard let websiteLabel else { return }
            websiteLabel.text = websiteLabelText
        }
    }
    
    var companyLabelText: String? {
        didSet {
            guard let companyLabel else { return }
            companyLabel.text = companyLabelText
        }
    }
    
    var addressLabelText: String? {
        didSet {
            guard let addressLabel else { return }
            addressLabel.text = addressLabelText
        }
    }
}
