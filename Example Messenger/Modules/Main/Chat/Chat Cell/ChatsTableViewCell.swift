//
//  ContactsTableViewCell.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 13.12.2020.
//

import UIKit

class ChatsTableViewCell: UITableViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "ChatCell"

    var userImageView = UIImageView()
    var userName = UILabel()
    var lastMessage = UILabel()
    var time = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        backgroundColor = Colors.mainWhite
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: OverChat = value as? OverChat else { return }
        userImageView.image = UIImage(named: chat.userImageString)
        userImageView.contentMode = .scaleAspectFill
        userImageView.layer.borderColor = Colors.buttonDark.cgColor
        userImageView.layer.borderWidth = 0.1

        userName.text = chat.username
        userName.font = UIFont.HelveticaNeue(size: 17)

        lastMessage.text = chat.lastMessage
        lastMessage.font = UIFont.HelveticaNeue(size: 15)
        lastMessage.textColor = .gray
        lastMessage.numberOfLines = 0

        time.text = chat.time
        time.textColor = .gray
        time.font = UIFont.HelveticaNeue(size: 13)
        
//        userImageView.backgroundColor = .black
//        userName.backgroundColor = .systemRed
//        lastMessage.backgroundColor = .systemBlue
//        time.backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup layout
extension ChatsTableViewCell {
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        time.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userImageView)
        addSubview(userName)
        addSubview(lastMessage)
        addSubview(time)
        
        
        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(equalToConstant: 60),
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userName.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            userName.trailingAnchor.constraint(equalTo: time.leadingAnchor, constant: -5),
            
            lastMessage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5),
            lastMessage.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 2),
            lastMessage.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            lastMessage.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),

            time.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            time.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])


      
//        stackView.anchor(top: topAnchor,
//                         left: leftAnchor,
//                         bottom: bottomAnchor,
//                         right: rightAnchor,
//                         paddingTop: 5,
//                         paddingLeft: 5,
//                         paddingBottom: 5,
//                         paddingRight: 10,
//                         width: self.frame.width,
//                         height: self.frame.height,
//                         enableInsets: false)
    }
}
