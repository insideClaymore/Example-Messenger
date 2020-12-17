//
//  UIViewController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: T.reuseIdentifire, bundle: nil)
        return storyboard.instantiateViewController(identifier: T.reuseIdentifire) as! T
    }
    
    func configureCollectionView<T: SelfConfiguringCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Unable to dequeu \(cellType)")
        }
        
        cell.configure(with: value)
        
        return cell
    }
    
    func configureTableView<T: SelfConfiguringCell, U: Hashable>(tableView: UITableView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Unable to dequeu \(cellType)")
        }
        
        cell.configure(with: value)
        
        return cell
    }
    
    func createSearchBar(delegate: UISearchBarDelegate, placeholder: String, placeholderSpace horizontal: CGFloat = 0.0) {
        navigationController?.navigationBar.barTintColor = Colors.mainWhite
        navigationController?.navigationBar.shadowImage = UIImage()
        
        var offset = UIOffset()
        offset = UIOffset(horizontal: horizontal, vertical: 0)
       
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = placeholder
        searchController.searchBar.setPositionAdjustment(offset, for: .search)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = delegate
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}
