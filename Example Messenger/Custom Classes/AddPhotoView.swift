//
//  AddProfilePhotoView.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit

class AddPhotoView: UIView {
    
    var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "avatar-1")
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.layer.borderColor = Colors.mainTurquoise.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        let myImage = UIImage(systemName: "plus.circle.fill")
        let pointSize: CGFloat = 40.0
        let config = UIImage.SymbolConfiguration(pointSize: pointSize)

        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(myImage, for: .normal)
        button.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        button.tintColor = Colors.mainTurquoise
        button.backgroundColor = .white
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        plusButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
        addSubview(circleImageView)
        addSubview(plusButton)
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
        plusButton.layer.masksToBounds = true
        plusButton.layer.cornerRadius = plusButton.frame.width / 2
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            circleImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            circleImageView.widthAnchor.constraint(equalToConstant: 120),
            circleImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 40),
            plusButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    private func addPhoto() {
        plusButton.increaseAnimation {}
    }
}
