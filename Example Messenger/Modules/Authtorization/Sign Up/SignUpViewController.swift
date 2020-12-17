//
//  RegisterViewController.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit
import AudioToolbox

class SignUpViewController: UIViewController {
  
    //MARK: @IBOutlets
    @IBOutlet weak var baseView: BaseView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: PasswordTextField!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var checkboxButton: Checkbox!
    @IBOutlet weak var enterButton: UIButton!
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        customizationViews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    //MARK: @IBActions
    @IBAction func cancelTap(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func registrationButtonTap(_ sender: UIButton) {
//        if emailTextField.text == "",
//           passwordTextField.text == "" {
//
//            noticeLabel.isHidden = false
//
//            noticeLabel.shake()
//            emailTextField.shake()
//            passwordTextField.shake()
//
//            emailTextField.indicateError()
//            passwordTextField.indicateError()
//
//            AudioServicesPlaySystemSound(1520)
//        }
        
        let vc: SetupProfileViewController = SetupProfileViewController.loadFromNib()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func enterTap(_ sender: UIButton) {
        let vc: SignInViewController = SignInViewController.loadFromNib()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func emailEditingDidBegin(_ sender: UITextField) {
        emailTextField.reset()
    }
    @IBAction func passwordEditingDidBegin(_ sender: UITextField) {
        passwordTextField.reset()
    }
}

//MARK: Extensions
extension SignUpViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func customizationViews() {
        emailTextField.setupBorder()
        passwordTextField.setupBorder()
        noticeLabel.isHidden = true
        registrationButton.set(cornerRadius: 7)
    }
}
