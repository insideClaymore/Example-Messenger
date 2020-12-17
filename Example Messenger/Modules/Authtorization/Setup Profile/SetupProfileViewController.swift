//
//  SetupProfile.swift
//  Example Messenger
//
//  Created by Алексей Макеров on 11.12.2020.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet private weak var baseView: BaseView!
    @IBOutlet private weak var addPhotoView: AddPhotoView!
    @IBOutlet private weak var nicknameTextField: OneLineTextField!
    @IBOutlet private weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var aboutMeTextView: UITextView!
    @IBOutlet private weak var startButton: UIButton!
    
    //MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        customizationViews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: @IBActions
    @IBAction private func cancelButtonTap(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}

//MARK: Extensions
extension SetupProfileViewController {
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func customizationViews() {
        startButton.set(cornerRadius: 7)
    }
}
