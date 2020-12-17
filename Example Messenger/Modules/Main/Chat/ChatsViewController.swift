//
//  СontactsViewController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 13.12.2020.
//

import UIKit


class ChatsViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case  overChats
    }

    let overChats = Bundle.main.decode([OverChat].self, from: "overChats.json")
    
    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, OverChat>?
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar(delegate: self, placeholder: "Search for messages or users", placeholderSpace: 55)
        setupTableView()
        createDataSource()
        reloadData()
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.rowHeight = 70
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 75, bottom: 0, right: 0)
        tableView.backgroundColor = Colors.mainWhite
        view.addSubview(tableView)
        
        tableView.register(ChatsTableViewCell.self, forCellReuseIdentifier: ChatsTableViewCell.reuseId)
    }
    
    private func reloadData(with searchText: String? = nil) {
        let filtered = overChats.filter { (user) -> Bool in
            user.contains(filter: searchText)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, OverChat>()
        snapshot.appendSections([.overChats])
        snapshot.appendItems(filtered, toSection: .overChats)
        
        dataSource?.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

// MARK: - Data Source
extension ChatsViewController {
    private func createDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, OverChat>(tableView: tableView) { (tableView, indexPath, chat) -> UITableViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .overChats:
                return self.configureTableView(tableView: tableView, cellType: ChatsTableViewCell.self, with: chat, for: indexPath)
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension ChatsViewController: UISearchBarDelegate {
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
        offset = UIOffset(horizontal: 55, vertical: 0)
        searchBar.setPositionAdjustment(offset, for: .search)
        reloadData(with: nil)
    }
}
