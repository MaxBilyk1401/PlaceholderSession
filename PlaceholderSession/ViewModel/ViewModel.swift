//
//  ViewModel.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/6/23.
//

import Foundation

class ViewModel {
    var onLoading: ((Bool) -> Void)?
    var onListUpdate: (([UsersModel]) -> Void)?
    var onFailure: ((Bool) -> Void)?
    
    func fetchData() {
        onLoading?(true)
        onFailure?(false)
        NetworkingManager.fetchData { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.onListUpdate?(success)
                case .failure:
                    self.onFailure?(true)
                }
                self.onLoading?(false)
            }
        }
    }
}
