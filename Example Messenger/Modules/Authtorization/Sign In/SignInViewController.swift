//
//  LoginViewController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit
import AudioToolbox

class SignInViewController: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet weak var baseView: BaseView!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var checkboxButton: Checkbox!
    @IBOutlet weak var registerButton: UIButton!
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        customizationViews()
      
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: @IBActions
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func enterTap(_ sender: UIButton) {
        //        noticeLabel.isHidden = false
        //
        //        noticeLabel.shake()
        //        emailTextField.shake()
        //        passwordTextField.shake()
        //
        //        emailTextField.indicateError()
        //        passwordTextField.indicateError()
        //
        //        AudioServicesPlaySystemSound(1520)
        
        let vc: MainTabBarController = MainTabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func registerTap(_ sender: Any) {
//        let vc: SignUpViewController = SignUpViewController.loadFromNib()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func emailEditingDidBegin(_ sender: UITextField) {
        sender.reset()
    }
    
    @IBAction func PasswordEditingDidBegin(_ sender: UITextField) {
        sender.reset()
    }
}

//MARK: Extensions
extension SignInViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func customizationViews() {
        emailTextField.setupBorder()
        passwordTextField.setupBorder()
        noticeLabel.isHidden = true
        enterButton.set(cornerRadius: 7)
    }
}
