//
//  ViewController.swift
//  swiftForever
//
//  Created by Zeynep Seyhan on 6/15/19.
//  Copyright © 2019 farukgozoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellID = "cellID"
    
    lazy var tableview : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        
        var a = 44
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(tableview)
        
        let constraints = [
        tableview.topAnchor.constraint(equalTo: view.topAnchor),
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
        
        dene()
    }
}
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for:indexPath)
        
        cell.textLabel?.text = "furkan"
        
        return cell
    }
}
