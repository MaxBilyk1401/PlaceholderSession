//
//  ViewController.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/5/23.
//

import UIKit

final class UsersVeiwController: UITableViewController {
    private var viewModel = UserViewModel()
    private var list = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindOnViewModel()
        viewModel.fetchData()
    }
    
    private func bindOnViewModel() {
        viewModel.onLoading = { [weak self] isLoading in
            guard let self else { return }
            if isLoading {
                self.tableView.refreshControl?.beginRefreshing()
            } else {
                self.tableView.refreshControl?.endRefreshing()
            }
        }
        
        viewModel.onListUpdate = { [weak self] list in
            guard let self else { return }
            self.list = list
            self.tableView.reloadData()
        }
        
        viewModel.onFailure = { [weak self] failure in
            guard let self else { return }
            guard let failure else { return }
            let alert = UIAlertController(title: String(failure),
                                          message: "Try again",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .cancel))
            if (failure != nil) {
                self.present(alert, animated: true)
            }
        }
    }
    
    @objc private func onTableLoading() {
        viewModel.fetchData()
    }
    
    private func setupTableView() {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(onTableLoading), for: .valueChanged)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: UserTableViewCell.self),
                                 bundle: nil),
                           forCellReuseIdentifier: String(describing: UserTableViewCell.self))
        tableView.refreshControl = control
    }
}
extension UsersVeiwController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self),
                                                 for: indexPath) as! UserTableViewCell
        let item = list[indexPath.row]
        cell.nameLabelText = String(item.name)
        cell.usernameLabelText = item.username
        cell.phoneLabelText = item.phone
        cell.websiteLabelText = item.website
        cell.companyLabelText = item.company.name
        cell.addressLabelText = item.address.city
        return cell
    }
}
