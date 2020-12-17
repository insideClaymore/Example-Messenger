//
//  ContactsTableViewCell.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 13.12.2020.
//

import UIKit

class ContactsTableViewCell: UITableViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ContactsCell"
    
    var userImageView = UIImageView()
    var userName = UILabel()
    var lastVisit = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Colors.mainWhite
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let contacts: OverChat = value as? OverChat else { return }
        userImageView.image = UIImage(named: contacts.userImageString)
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.borderColor = Colors.buttonDark.cgColor
        userImageView.layer.borderWidth = 0.1
        
        userName.text = contacts.username
        userName.font = UIFont.HelveticaNeue(size: 17)
        
        lastVisit.text = contacts.lastVisit
        lastVisit.textColor = .gray
        lastVisit.font = UIFont.HelveticaNeue(size: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout
extension ContactsTableViewCell {
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        lastVisit.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userImageView)
        addSubview(userName)
        addSubview(lastVisit)
        
        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(equalToConstant: 45),
            userImageView.heightAnchor.constraint(equalToConstant: 45),
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            userName.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            lastVisit.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            lastVisit.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
        ])
    }
}
