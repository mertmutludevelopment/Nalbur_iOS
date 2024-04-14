//
//  RegisterViewController.swift
//  Nalbur
//
//  Created by MERT MUTLU on 6.02.2024.
//

import Foundation
import UIKit
//import SkyFloatingLabelTextField


class RegisterViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldSurname: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordAgain: UITextField!
    @IBOutlet weak var textFieldIdNumber: UITextField!
    @IBOutlet weak var btnPasswordRightView: UIButton!
    @IBOutlet weak var btnPasswordAgainRightView: UIButton!
    @IBOutlet weak var btnRegister: UIButton!

    private var isSecure = true
    private var passwordImageRightView = UIImageView()
    var receivedEmail : String?

    
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
        
    }
    
    
    private func initialize(){
        
        //view Background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background2")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        
        if let email = receivedEmail {
            textFieldEmail.text = email
        }
        
        let userNameImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        userNameImageViewLeft.backgroundColor = UIColor.clear
        userNameImageViewLeft.image = UIImage(named: "user")
        userNameImageViewLeft.contentMode = .scaleAspectFill
        
        let userNameView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        userNameView.addSubview(userNameImageViewLeft)
        
        textFieldName.leftView = userNameView
        textFieldName.leftViewMode = .always
        textFieldName.textContentType = .name
        textFieldName.placeholder = "Name"
        textFieldName.keyboardType = .alphabet
        textFieldName.delegate = self

        
  
        
        let userSurnameImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        userSurnameImageViewLeft.backgroundColor = UIColor.clear
        userSurnameImageViewLeft.image = UIImage(named: "user")
        userSurnameImageViewLeft.contentMode = .scaleAspectFill
    
        let userSurnameView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        userSurnameView.addSubview(userSurnameImageViewLeft)
        textFieldSurname.leftView = userSurnameView
        textFieldSurname.leftViewMode = .always
        textFieldSurname.textContentType = .name
        textFieldSurname.placeholder = "Surname"
        textFieldSurname.keyboardType = .alphabet
        textFieldSurname.delegate = self
        
        
        
        let emailImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        emailImageViewLeft.backgroundColor = UIColor.clear
        emailImageViewLeft.image = UIImage(named: "email")
        emailImageViewLeft.contentMode = .scaleAspectFill
        
        let emailView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        emailView.addSubview(emailImageViewLeft)
        
        textFieldEmail.leftView = emailView
        textFieldEmail.leftViewMode = .always
        textFieldEmail.textContentType = .emailAddress
        textFieldEmail.placeholder = "Type email"
        textFieldEmail.keyboardType = .alphabet
        textFieldEmail.delegate = self

        
        //textField password
        let passwordImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        passwordImageViewLeft.backgroundColor = UIColor.clear
        passwordImageViewLeft.image = UIImage(named: "password")
        passwordImageViewLeft.contentMode = .scaleAspectFill
        
        let passwordView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        passwordView.addSubview(passwordImageViewLeft)
        
        textFieldPassword.leftView = passwordView
        textFieldPassword.leftViewMode = .always
        
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
        
        
        
        
        //textField password again
        let passwordAgainImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        passwordAgainImageViewLeft.backgroundColor = UIColor.clear
        passwordAgainImageViewLeft.image = UIImage(named: "password")
        passwordAgainImageViewLeft.contentMode = .scaleAspectFill
        
        let passwordAgainView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        passwordAgainView.addSubview(passwordAgainImageViewLeft)
        
        textFieldPasswordAgain.leftView = passwordAgainView
        textFieldPasswordAgain.leftViewMode = .always
        textFieldPasswordAgain.placeholder = "Password Again"
        textFieldPasswordAgain.keyboardType = .alphabet
        textFieldPasswordAgain.delegate = self
        textFieldPasswordAgain.textContentType = .password
        textFieldPasswordAgain.isSecureTextEntry = isSecure
        
        btnPasswordAgainRightView.backgroundColor = UIColor.clear
        textFieldPasswordAgain.rightViewMode = .unlessEditing
        btnPasswordAgainRightView.setImage(UIImage(named: "hidden"), for: .normal)
        textFieldPasswordAgain.rightView = btnPasswordAgainRightView
        textFieldPasswordAgain.rightViewMode = .always

        
        
        //textField User ID Number
        let userIdImageViewLeft = UIImageView(frame: CGRect.init(x: 15, y: 10, width: 20, height: 20))
        userIdImageViewLeft.backgroundColor = UIColor.clear
        userIdImageViewLeft.image = UIImage(named: "userId")
        userIdImageViewLeft.contentMode = .scaleAspectFill
        
        let userIdView = UIView(frame: CGRect.init(x: 0, y: 0, width: 45, height: 40))
        userIdView.addSubview(userIdImageViewLeft)
        textFieldIdNumber.leftView = userIdView
        textFieldIdNumber.leftViewMode = .always
        textFieldIdNumber.placeholder = "Id Number"
        textFieldIdNumber.keyboardType = .numberPad
        textFieldIdNumber.delegate = self
        
        
        
        
        
        btnRegister.setTitle("Sign up", for: .normal)
        btnRegister.layer.borderWidth = 0.5
        btnRegister.layer.cornerRadius = 5.0
        
        
    }
    
    
    
   
    
    
}

extension RegisterViewController{
    
    @IBAction func actionBtnPasswordRightView(_ sender: UIButton) {
        btnPasswordRightView.setImage(UIImage(named : isSecure ? "eye" : "hidden" ), for: .normal)
        isSecure = !isSecure
        textFieldPassword.isSecureTextEntry = isSecure
    }
    
    @IBAction func actionBtnPasswordAgainRightView(_ sender: Any) {
      
        btnPasswordAgainRightView.setImage(UIImage(named : isSecure ? "eye" : "hidden" ), for: .normal)
        isSecure = !isSecure
        textFieldPasswordAgain.isSecureTextEntry = isSecure
        
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

extension RegisterViewController: UITextViewDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool{
        
        if textField == textFieldEmail {
            let currentText = textField.text ?? ""
            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            let maxLength = 30
            
            if updatedText.count > maxLength {
                return false
            }
            
            textFieldEmail.layer.borderColor = !isValidEmail(email: textFieldEmail.text!) ? UIColor.red.cgColor :UIColor.red.cgColor
            textFieldEmail.layer.borderWidth = !isValidEmail(email: textFieldEmail.text!) ? 1.0 : 0.0
            }
        
        return true

    }
        
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == textFieldName{
            
            let minLength = 3
            
            if let userName = textFieldName.text, userName.count < minLength {
                showError(message: "Name cannot be less than \(minLength) characters")

            } else if let userName = textField.text, userName.count >= minLength {
                let containsOnlyLetters = userName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil

                if !containsOnlyLetters{
                    showError(message: "The name must contain only letters")
                }
            }

        }else if textField == textFieldSurname{
            let minLength = 2
            
            if let userLastName = textFieldSurname.text, userLastName.count < minLength {
                showError(message: "Last name cannot be less than \(minLength) characters")

            } else if let userLastName = textFieldSurname.text, userLastName.count >= minLength {
                let containsOnlyLetters = userLastName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil

                if !containsOnlyLetters{
                    showError(message: "The last name must contain only letters")
                }
            }

        }
        else if textField == textFieldEmail {
                let minLength = 10
                let maxLength = 30
                
                var lengthControl: Bool
                var formatControl: Bool
                
                if let email = textField.text, email.count < minLength || email.count > maxLength {
                    lengthControl = false
                } else {
                    lengthControl = true
                }
                
                formatControl = isValidEmail(email: textField.text!)
                
                // Hata kontrollerini birleştirme
                if !lengthControl || !formatControl {
                    showError(message: "Email should be between \(minLength) and \(maxLength) characters and have a valid format.")
                }
            
            }
        else if textField == textFieldPassword {
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
        else if textField == textFieldPasswordAgain {
            if textFieldPasswordAgain.text != textFieldPassword.text {
                    showError(message: "Passwords do not match")
                }
        }
        else if textField == textFieldIdNumber {
    
            let tckno = textFieldIdNumber.text
          

            let lastDigit = tckno?.last.flatMap { Int(String($0)) }
            let newtckno = tckno?.prefix(10)
            let firstTen = newtckno?.compactMap {Int(String($0))}
            let sum = firstTen?.reduce(0,+)
            let mod = sum! % 10

            
            if tckno?.count == 11 && firstTen![0] != 0  {
                if mod != lastDigit{
                    showError(message: "Wrong user id")
                }
            }else{
                showError(message: "Id must be 11 digits and first digit cannot be '0'")

            }
            
        }

        
        
        
    }
    
   
}
