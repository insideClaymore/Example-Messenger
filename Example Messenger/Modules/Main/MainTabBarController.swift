//
//  MainTabBarController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 13.12.2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = Colors.mainTurquoise
        
        let contactsViewController = ContactsViewController()
        let chatViewController = ChatsViewController()
        let settingsViewController = SettingsViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        
        let contactImage = UIImage(systemName: "person.2.fill", withConfiguration: boldConfig)!
        let chatImage = UIImage(systemName: "person.crop.circle.fill", withConfiguration: boldConfig)!
        let settingsImage = UIImage(systemName: "gear", withConfiguration: boldConfig)!
        
        viewControllers = [
            generatyNavigationController(rootViewController: contactsViewController, title: "Контакты", image: contactImage),
            generatyNavigationController(rootViewController: chatViewController, title: "Чаты", image: chatImage),
            generatyNavigationController(rootViewController: settingsViewController, title: "Настройки", image: settingsImage)
        ]
    }
    
    private func generatyNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.title = title
        return navigationVC
    }
}
