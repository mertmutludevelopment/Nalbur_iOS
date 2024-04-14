//
//  LoginViewController.swift
//  Nalbur
//
//  Created by MERT MUTLU on 6.02.2024.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet private weak var textFieldEmail: UITextField!
    @IBOutlet private weak var textFieldPassword: UITextField!
    @IBOutlet private weak var btnLogin: UIButton!
    @IBOutlet private weak var btnRemindMe: UIButton!
    @IBOutlet private weak var lblRegisterLink: UILabel!
    @IBOutlet private weak var lblRemindMe: UILabel!
    @IBOutlet weak var btnPasswordRightView: UIButton!
    
    @IBOutlet private weak var emailIcon: UIImageView!
    private var isSecure = true
    private var isRemembered = false
    private var passwordImageRightView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "LVCtoRVC" && textFieldEmail != nil {
             if let destinationVC =  segue.destination as? RegisterViewController {
                 
                 destinationVC.receivedEmail = textFieldEmail.text
             }
         }
     }
    
    
    private func initialize(){
        
        //view Background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background2")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        
        let emailImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        emailImageViewLeft.backgroundColor = UIColor.clear
        emailImageViewLeft.image = UIImage(named: "email")
        emailImageViewLeft.contentMode = .scaleAspectFill
        
        let emailView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        emailView.addSubview(emailImageViewLeft)
        
        textFieldEmail.leftView = emailView
        textFieldEmail.leftViewMode = .always
        
        textFieldEmail.textContentType = .emailAddress
        textFieldEmail.placeholder = "E-mail"
        textFieldEmail.keyboardType = .alphabet
        textFieldEmail.delegate = self
        let email = UserDefaults.standard.string(forKey: "UserEmail")
        textFieldEmail.text = email
        
        
        if email == nil || email!.isEmpty {
            textFieldEmail.becomeFirstResponder()
        }else{
            textFieldPassword.becomeFirstResponder()
        }
        
        
        
        let passwordImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        passwordImageViewLeft.backgroundColor = UIColor.clear
        passwordImageViewLeft.image = UIImage(named: "password")
        passwordImageViewLeft.contentMode = .scaleAspectFill
        
        let passwordView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        passwordView.addSubview(passwordImageViewLeft)
        
        textFieldPassword.leftView = passwordView
        textFieldPassword.leftViewMode = .always
        
        
        let password = UserDefaults.standard.string(forKey: "UserPassword")
        textFieldPassword.text = password
        textFieldPassword.placeholder = "Password"
        textFieldPassword.keyboardType = .alphabet
        textFieldPassword.delegate = self
        textFieldPassword.textContentType = .password
        textFieldPassword.isSecureTextEntry = isSecure
        
        btnPasswordRightView.backgroundColor = UIColor.clear
        textFieldPassword.rightViewMode = .unlessEditing
        btnPasswordRightView.setImage(UIImage(named: "hidden"), for: .normal)
        textFieldPassword.rightView = btnPasswordRightView
        textFieldPassword.rightViewMode = .always
        
        
        
        lblRemindMe.text = "Remind Me"
        //lblRemindMe.font
        btnRemindMe.backgroundColor = UIColor.clear
        btnRemindMe.layer.borderWidth = 0.5
        btnRemindMe.layer.cornerRadius = 5.0
        
        
        
        btnLogin.setTitle("Sign in", for: .normal)
        btnLogin.layer.borderWidth = 0.5
        btnLogin.layer.cornerRadius = 5.0
        
        
        lblRegisterLink.text = "Don't have an account? Sign up"
        lblRegisterLink.textAlignment = .center
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblRegisterTapped))
        lblRegisterLink.isUserInteractionEnabled = true
        lblRegisterLink.addGestureRecognizer(tapGesture)
        
    }
    
    
    
}

extension LoginViewController {
    
    @objc func lblRegisterTapped(_ gesture: UITapGestureRecognizer)  {
        performSegue(withIdentifier: "LVCtoRVC", sender: self)
    }
    
    
    @IBAction func actionBtnPasswordRightView(_ sender: UIButton) {
        
        if( isSecure ){
            
            btnPasswordRightView.setImage(UIImage(named: "eye"), for: .normal)
            isSecure = !isSecure
            textFieldPassword.isSecureTextEntry = isSecure
            
        }else{
            btnPasswordRightView.setImage(UIImage(named: "hidden"), for: .normal)
            isSecure = !isSecure
            textFieldPassword.isSecureTextEntry = isSecure
            
        }
        
    }
    
    
    @IBAction func actionBtnRemindMeTapped(_ sender: UIButton) {
        btnRemindMe.layer.borderWidth = 0
        isRemembered = !isRemembered
        let remindMeImage = isRemembered ? "checkmark.square.fill" : "square"
        let systemImage = UIImage(systemName: remindMeImage)
        btnRemindMe.setImage(systemImage, for: .normal)
        
        
    }
    
    @IBAction func actionBtnLogin(_ sender: UIButton) {
        
       /* var isValid = isValid()
        
        if !isValid {
            return
        }*/
        
        let response =  RepositoryService.shared.signIn(email: textFieldEmail.text!, password: textFieldPassword.text!)
        
        if response.result && isRemembered {
            UserDefaults.standard.set(response.user!.email, forKey: "UserEmail")
            UserDefaults.standard.set(response.user!.password, forKey: "UserPassword")

            
        }
        
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func showError(message: String) {
        // Hata mesajını kullanıcıya göster, örneğin bir uyarı penceresi veya bir etiket üzerinde
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
}


extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == textFieldEmail {
            textFieldPassword.becomeFirstResponder()
        } else if textField == textFieldPassword {
            textFieldPassword.resignFirstResponder()
        }else {
            textFieldEmail.resignFirstResponder()
            textFieldPassword.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let keyboardDoneButtonShow = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 35))
        keyboardDoneButtonShow.barTintColor = UIColor(hex:"BBC2CA")
        
        let doneButton = UIBarButtonItem(title: "Tamam", style: UIBarButtonItem.Style.done, target: self, action: #selector(UITextFieldDelegate.textFieldShouldReturn(_:)))
        doneButton.tintColor =  UIColor.darkGray
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       
        let toolbarButton = [flexSpace, doneButton]
        keyboardDoneButtonShow.setItems(toolbarButton, animated: false)
        textField.inputAccessoryView = keyboardDoneButtonShow
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        if textField == textFieldEmail {
            let currentText = textField.text ?? ""
            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                    
            let maxLength = 30
                
            if updatedText.count > maxLength {
                return false
                }
            }
        
        if let email = textField.text, !isValidEmail(email: email) {
            textFieldEmail.layer.borderColor = UIColor.red.cgColor
            textFieldEmail.layer.borderWidth = 1.0
        } else {
            textFieldEmail.layer.borderColor = UIColor.clear.cgColor
            textFieldEmail.layer.borderWidth = 0.0
        }
    
        return true
        
    }
 
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
        /**
         
         */
    
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == textFieldEmail {
                let minLength = 4
                let maxLength = 30
                
                var lengthControl: Bool
                var formatControl: Bool
                
                if let email = textField.text, email.count < minLength || email.count > maxLength {
                    lengthControl = false
                } else {
                    lengthControl = true
                }
                
                formatControl = isValidEmail(email: textField.text ?? "")
                
                // Hata kontrollerini birleştirme
                if !lengthControl || !formatControl {
                    showError(message: "Email should be between \(minLength) and \(maxLength) characters and have a valid format.")
                }
            
            }else if textField == textFieldPassword {
                let minLength = 6

                if let password = textFieldPassword.text, password.count >= minLength {
                    let containsUpperCase = password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
                    let containsSpecialCharacter = password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil

                    if !containsUpperCase || !containsSpecialCharacter {
                        showError(message: "Password must contain at least one uppercase letter and one special character")
                    }
                } else {
                    showError(message: "Password must be at least \(minLength) characters long")
                }
            }
        
        
        
    }
    
    
    
}

