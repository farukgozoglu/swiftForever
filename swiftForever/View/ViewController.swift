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
        tableView.register(UITableViewCell.self)
        tableView.tableHeaderView = TableHeaderView(frame : CGRect(x:0, y:0, width:0, height: 200))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    lazy var searchController : UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    var furkan = ["basket", "kosu", "tablet izlemek", "yuzmek", "sucuklu yumurta"]
    var filteredFurkan = [String]()
    var isSearching = false

    override func viewDidLoad() {
        
      
        super.viewDidLoad()
        view.backgroundColor = .red
        tableviewConstruct()
    
    
       navigationItem.searchController = searchController
    }
    
    
    private func tableviewConstruct(){
        view.addSubview(tableview)
        
        let constraints = [
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredFurkan.count : furkan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, forIndexPath:indexPath)
        
        cell.textLabel?.text = isSearching ? filteredFurkan[indexPath.row] : furkan[indexPath.row]
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.furkan.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            isSearching = false
            tableview.reloadData()
        }else{
            isSearching = true
            filteredFurkan = furkan.filter{$0.lowercased().contains(searchText.lowercased())}
            tableview.reloadData()
        }
        
        
    }
    
}



