//
//  RegisterViewController.swift
//  Nalbur
//
//

import Foundation
import UIKit
import CoreLocation
//import SkyFloatingLabelTextField


class RegisterViewController: UIViewController,UITextFieldDelegate,CLLocationManagerDelegate{
    
    private var locationManager : CLLocationManager?
    
    @IBOutlet private weak var btnBack: UIBarButtonItem!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var uiView: UIView!
    @IBOutlet private weak var uiViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var textFieldName: UITextField!
    @IBOutlet private weak var textFieldSurname: UITextField!
    @IBOutlet private weak var textFieldEmail: UITextField!
    @IBOutlet private weak var textFieldPassword: UITextField!
    @IBOutlet private weak var textFieldPasswordAgain: UITextField!
    @IBOutlet private weak var textFieldIdNumber: UITextField!
    @IBOutlet private weak var btnPasswordRightView: UIButton!
    @IBOutlet private weak var btnPasswordAgainRightView: UIButton!
    @IBOutlet private weak var textFieldTest: UITextField!
    @IBOutlet private weak var btnPolicy: UIButton!
    @IBOutlet private weak var lblPolicy: UILabel!
    @IBOutlet private weak var btnRegister: UIButton!
    
    private var isSecure = true
    private var passwordImageRightView = UIImageView()
    var receivedEmail : String?
    private var isPolicyBtnChecked = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self){
                if CLLocationManager.isRangingAvailable(){
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: uiViewHeight.constant)
        
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
        
        self.title = "register.navbar.title.text".localized
        
        //view Background
        uiView.backgroundColor = UIColor.clear
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background2")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
        
        btnBack.image = UIImage(named: "backbutton")
        
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
        textFieldName.placeholder = "register.textFieldName.placeholder".localized
        textFieldName.keyboardType = .default
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
        textFieldSurname.placeholder = "register.textFieldSurname.placeholder".localized
        textFieldSurname.keyboardType = .default
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
        textFieldEmail.placeholder = "register.textFieldEmail.placeholder".localized
        textFieldEmail.keyboardType = .emailAddress
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
        
        textFieldPassword.placeholder = "register.textFieldPassword.placeholder".localized
        textFieldPassword.keyboardType = .asciiCapable
        textFieldPassword.delegate = self
        textFieldPassword.textContentType = .password
        textFieldPassword.isSecureTextEntry = isSecure
        
        btnPasswordRightView.backgroundColor = UIColor.clear
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
        textFieldPasswordAgain.placeholder = "register.textFieldPasswordAgain.placeholder".localized
        textFieldPasswordAgain.keyboardType = .asciiCapable
        textFieldPasswordAgain.delegate = self
        textFieldPasswordAgain.textContentType = .password
        textFieldPasswordAgain.isSecureTextEntry = isSecure
        
        btnPasswordAgainRightView.backgroundColor = UIColor.clear
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
        textFieldIdNumber.placeholder = "register.textFieldNumber.placeholder".localized
        textFieldIdNumber.keyboardType = .numberPad
        textFieldIdNumber.delegate = self
        
        btnPolicy.backgroundColor = UIColor.clear
        btnPolicy.setImage(UIImage(named: "unchecked"), for: .normal)
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "register.lblPolicy.text".localized, attributes: underlineAttribute)
        lblPolicy.attributedText = underlineAttributedString
        lblPolicy.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblPolicyClicked))
        lblPolicy.addGestureRecognizer(tapGesture)
        
        btnRegister.backgroundColor = UIColor(hex: "#4D0DD0")
        btnRegister.setTitle("register.btnRegister.title".localized , for: .normal)
        btnRegister.setTitleColor(.white, for: .normal)
        btnRegister.layer.borderWidth = 0.5
        btnRegister.layer.cornerRadius = 30.0
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        toolbar.barStyle = .default
        toolbar.barTintColor = UIColor.systemGray
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = UIColor.black
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        textFieldTest.inputView = datePicker
        textFieldTest.text = formatDate(date: Date())
        textFieldTest.inputAccessoryView = toolbar
    }
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        textFieldTest.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    @objc func doneButtonTapped() {
        textFieldTest.resignFirstResponder() // Klavyeyi kapat
    }
}

extension RegisterViewController{
    
    @objc func lblPolicyClicked(_ gesture:UITapGestureRecognizer){
        
        let controller = StoryboardManager.shared().getController(.policy, controller : "PolicyViewController" , type : PolicyViewController.self)
        controller.delegate = self
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    @IBAction func actionBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionBtnPasswordRightView(_ sender: UIButton) {
        btnPasswordRightView.setImage(UIImage(named : isSecure ? "eye" : "hidden" ), for: .normal)
        isSecure = !isSecure
        textFieldPassword.isSecureTextEntry = isSecure
    }
    
    @IBAction func actionBtnPasswordAgainRightView(_ sender: UIButton) {
        btnPasswordAgainRightView.setImage(UIImage(named : isSecure ? "eye" : "hidden" ), for: .normal)
        isSecure = !isSecure
        textFieldPasswordAgain.isSecureTextEntry = isSecure
    }
    
    @IBAction func actionBtnPolicy(_ sender: UIButton) {
        isPolicyBtnChecked = !isPolicyBtnChecked
        btnPolicy.setImage(UIImage(named: isPolicyBtnChecked ? "checked" : "unchecked"), for: .normal)
    }
    
    @IBAction func acitonBtnRegister(_ sender: UIButton){
        let userName = textFieldName.text ?? ""
        let userSurname = textFieldSurname.text ?? ""
        
        checkName(userName: userName)
        checkSurname(userLastName: userSurname)
        checkEmail(email: textFieldEmail.text ?? "" )
        checkPassword(password: textFieldPassword.text ?? "" )
        checkPasswordAgain(password: textFieldPassword.text ?? "" , passwordAgain: textFieldPasswordAgain.text ?? "" )
        checkId(userID: textFieldIdNumber.text ?? "" )
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
    
    private func checkName(userName: String){
        let minLength = 3
        
        if  userName.count < minLength {
            showError(message: "Name cannot be less than \(minLength) characters")
            
        } else if userName.count >= minLength {
            let containsOnlyLetters = userName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
            
            if !containsOnlyLetters{
                showError(message: "The name must contain only letters")
            }
        }
    }
    
    private func checkSurname(userLastName: String){
        let minLength = 2
        
        if  userLastName.count < minLength {
            showError(message: "Last name cannot be less than \(minLength) characters")
            
        } else if  userLastName.count >= minLength {
            let containsOnlyLetters = userLastName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
            
            if !containsOnlyLetters{
                showError(message: "The last name must contain only letters")
            }
        }
    }
    
    private func checkEmail(email: String){
        if !isValidEmail(email: email) {
            showError(message: "Email has an error.")
            return
        }
    }
    
    private func checkPassword(password: String){
        let minLength = 6

        if password.count >= minLength {
            let containsUpperCase = password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil
            let containsSpecialCharacter = password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
            
            if !containsUpperCase || !containsSpecialCharacter {
                showError(message: "Password must contain at least one uppercase letter and one special character")
            }
        } else {
            showError(message: "Password must be at least \(minLength) characters long")
        }
    }
    
    private func checkPasswordAgain(password: String , passwordAgain : String){
        if passwordAgain != password {
            showError(message: "Passwords do not match")
        }
    }
    
    private func checkId(userID: String){
        let lastDigit = userID.last.flatMap { Int(String($0)) }
        let newtckno = userID.prefix(10)
        let firstTen = newtckno.compactMap {Int(String($0))}
        let sum = firstTen.reduce(0,+)
        let mod = sum % 10
        
        if userID.count == 11 && firstTen[0] != 0  {
            if mod != lastDigit{
                showError(message: "Wrong user id")
            }
        }else{
            showError(message: "Id must be 11 digits and first digit cannot be '0'")
        }
    }
}

extension RegisterViewController: UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFieldName:
            textFieldSurname.becomeFirstResponder()
        case textFieldSurname:
            textFieldEmail.becomeFirstResponder()
        case textFieldEmail:
            textFieldPassword.becomeFirstResponder()
        case textFieldPassword:
            textFieldPasswordAgain.becomeFirstResponder()
        case textFieldPasswordAgain:
            textFieldIdNumber.becomeFirstResponder()
        case textFieldIdNumber:
            textFieldIdNumber.resignFirstResponder()
        default:
            break
        }
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let keyboardDoneButtonShow = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 35))
        keyboardDoneButtonShow.barTintColor = UIColor(hex:"BBC2CA")
        
        let doneButton = UIBarButtonItem(title: "OK", style: UIBarButtonItem.Style.done, target: self, action: #selector(UITextFieldDelegate.textFieldShouldReturn(_:)))
        doneButton.tintColor =  UIColor.darkGray
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let toolbarButton = [flexSpace, doneButton]
        keyboardDoneButtonShow.setItems(toolbarButton, animated: false)
        textField.inputAccessoryView = keyboardDoneButtonShow

        return true
    }
    
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
  
}

extension RegisterViewController : PolicyViewControllerDelegate {
    func approvedPolicy() {
        self.btnPolicy.setImage(UIImage(named: "checked"), for: .normal)
    }
}


