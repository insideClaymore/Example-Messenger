//
//  ViewController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit

class AuthViewController: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        customizationViews()
    }
    
    //MARK: @IBActions
    @IBAction func loginTap(_ sender: UIButton) {
        let vc: SignInViewController = SignInViewController.loadFromNib()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func registerTap(_ sender: UIButton) {
        let vc: SignUpViewController = SignUpViewController.loadFromNib()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

//MARK: ExtensionsAuthViewController
extension AuthViewController {
    private func customizationViews() {
        loginButton.set(cornerRadius: 7)
        registerButton.set(cornerRadius: 7)
    }
}

