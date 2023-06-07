//
//  UserUiComposer.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/7/23.
//

import UIKit

final class UserUIComposer {
    
    static func build() -> UITableViewController {
        var vc = UsersVeiwController()
        var viewModel = ViewModel()
        vc.viewModel = viewModel
        viewModel.view = vc 
        return vc
    }
    
    private init() {}
}
