//
//  UsersViewController.swift
//  cp-sample-app
//
//  Created by Danilo Gomes on 3/8/18.
//  Copyright © 2018 Accela Inc. All rights reserved.
//

import UIKit
import cp_sample_api
import cp_sample_model

class UsersViewController: UITableViewController {

    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveUsers()
    }
    
    func retrieveUsers(){
        let api = UserAPI()
        users = api.retrieveUsers()
        self.tableView.reloadData()
    }

    func populate(cell: UITableViewCell, row: User){
        cell.textLabel?.text = row.name
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let user = users[indexPath.row]
        
        populate(cell: cell, row: user)
        
        return cell
    }
}
