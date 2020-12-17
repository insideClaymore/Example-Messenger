//
//  PeopleViewController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 13.12.2020.
//

import UIKit

class ContactsViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case  overChats
    }
    
    let overContacts = Bundle.main.decode([OverChat].self, from: "overChats.json")
    
    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, OverChat>?
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar(delegate: self, placeholder: "Search", placeholderSpace: 135)
        setupTableView()
        createDataSource()
        reloadData(with: nil)
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.rowHeight = 55
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        tableView.backgroundColor = Colors.mainWhite
        view.addSubview(tableView)
        
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: ContactsTableViewCell.reuseId)
    }
    
    private func reloadData(with searchText: String?) {
        let filtered = overContacts.filter { (user) -> Bool in
            user.contains(filter: searchText)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, OverChat>()
        snapshot.appendSections([.overChats])
        snapshot.appendItems(filtered, toSection: .overChats)
        
        dataSource?.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}


// MARK: - Data Source
extension ContactsViewController {
    
    private func createDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, OverChat>(tableView: tableView, cellProvider: { (tableView, indexPath, chat) -> UITableViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError()
            }
            switch section {
            case .overChats:
                return self.configureTableView(tableView: tableView, cellType: ContactsTableViewCell.self, with: chat, for: indexPath)
            }
        })
    }
}

// MARK: - UISearchBarDelegate
extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadData(with: searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        var offset = UIOffset()
        offset = UIOffset(horizontal: 0, vertical: 0)
        searchBar.setPositionAdjustment(offset, for: .search)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        var offset = UIOffset()
        offset = UIOffset(horizontal: 135, vertical: 0)
        searchBar.setPositionAdjustment(offset, for: .search)
        reloadData(with: nil)
    }
}
