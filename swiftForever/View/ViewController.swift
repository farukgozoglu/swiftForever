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
    
    private let networkManager = NetworkManager()
    private let path = "/2.2/tags/swift/top-answerers/all_time?site=stackoverflow"
    private var items = [Items]()
    
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
    var filteredItems = [Items]()
    var isSearching = false

    override func viewDidLoad() {
        
      
        super.viewDidLoad()
        view.backgroundColor = .red
        tableviewConstruct()
    
    
       navigationItem.searchController = searchController
      
        networkManager.fetchData(path: path) { (response) in
            guard let items = response?.items else {return}
            print("hello")
            
            self.items = items
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
            
//            for item in items{
//                print(item.user?.display_name)
//            }
        }
        
    }
    
    
    private func tableviewConstruct(){
        view.addSubview(tableview)
        
        let constraints = [
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130)]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredItems.count : items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, forIndexPath:indexPath)
        
        cell.textLabel?.text = isSearching ? filteredItems[indexPath.row].user?.display_name : items[indexPath.row].user?.display_name
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.items.remove(at: indexPath.row)
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
            filteredItems = items.filter{($0.user?.display_name!.lowercased())!.contains(searchText.lowercased())}
        
            tableview.reloadData()
        }
        
        
    }
    
}



