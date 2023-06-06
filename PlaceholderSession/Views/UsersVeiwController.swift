//
//  ViewController.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/5/23.
//

import UIKit

final class UsersVeiwController: UITableViewController {
    private let userTableView = UITableView()
    let viewModel = ViewModel()
    var list = [UsersModel]()
    
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
    }
    
    @objc private func onTableLoading() {
        viewModel.fetchData()
    }
    
    private func setupTableView() {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(onTableLoading), for: .valueChanged)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
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
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))!
        let name = list[indexPath.row].name
        cell.textLabel?.text = String(describing: name)
        return cell
    }
}
