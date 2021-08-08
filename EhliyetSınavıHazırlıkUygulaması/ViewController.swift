//
//  ViewController.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 7.08.2021.
//

import UIKit
import Parse
class ViewController: UIViewController {

    var loginorsign = true
    
    @IBOutlet weak var signUpBottom: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginBottom: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginSignUpButton: UIButton!
    @IBOutlet weak var forgetPassword: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        signUpBottom.isHidden = true
        
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        loginorsign = true
        loginBottom.isHidden = false
        signUpBottom.isHidden = true
        loginSignUpButton.setImage(UIImage(named: "LoginBottom"), for: UIControl.State.normal)
        loginButton.setImage(UIImage(named: "LoginBoldButton"), for: UIControl.State.normal)
        signUpButton.setImage(UIImage(named: "SignUpThinButton"), for: UIControl.State.normal)
        forgetPassword.isHidden = false
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        loginorsign = false
        loginBottom.isHidden = true
        signUpBottom.isHidden = false
        loginSignUpButton.setImage(UIImage(named: "SignupBottom"), for: UIControl.State.normal)
        signUpButton.setImage(UIImage(named: "SignupBoldButton"), for: UIControl.State.normal)
        loginButton.setImage(UIImage(named: "LoginThinButton"), for: UIControl.State.normal)
        forgetPassword.isHidden = true
        
        
    }
    
    @IBAction func loginSignUpButtonClicked(_ sender: Any) {
        
        if loginorsign == true {
        
            
            
            
            if  isValidEmail(emailText.text!) == true && emailText.text != nil && passwordText.text != nil &&  emailText.text != "" &&  passwordText.text != "" {
                
                PFUser.logInWithUsername(inBackground: emailText.text!, password: passwordText.text!) { user, error in
                        
                    if error != nil
                    {
                     
                        
                        
                        self.makeAlert(titleInput: "Hata", messageInput: "Email Adresiniz ya da Şifreniz Geçersiz." )
                        
                    }else {
                        
                        self.performSegue(withIdentifier: "toTabBar", sender: nil)
                        
                    }
                    
                }
                
                
                
            }else if emailText.text == nil || emailText.text == "" {
                
                makeAlert(titleInput: "Hata", messageInput: "Email adresi boş geçilemez.")
            } else if  passwordText.text == nil || passwordText.text!.count < 8 {
                
                makeAlert(titleInput: "Hata", messageInput: "Şifre 8 karakterden az olamaz.")
            } else
             {
                makeAlert(titleInput: "Hata", messageInput: "Email Adresiniz ya da Şifreniz Geçersiz.")
            }
            
            
            
            
            
        }else {
            
            
            if isValidEmail(emailText.text!) == true && emailText.text != nil && passwordText.text != nil  &&  emailText.text != "" &&  passwordText.text != "" {
                
                let user = PFUser()
                user.username = emailText.text
                user.password = passwordText.text
                
                user.signUpInBackground { bool, error in
                    
                    if(error != nil ){
                        
                        self.makeAlert(titleInput: "Hata", messageInput: "Email Adresiniz ya da Şifreniz Geçersiz." )
                        
                        
                    }else {
                        
                
                        self.performSegue(withIdentifier: "toTabBar", sender: nil)
                        
                    }
                    
                    
                }
                
            }else if emailText.text == nil || emailText.text == ""  {
                
                makeAlert(titleInput: "Hata", messageInput: "Email adresi boş geçilemez.")
            } else if  passwordText.text == nil || passwordText.text!.count < 8 {
                
                makeAlert(titleInput: "Hata", messageInput: "Şifre 8 karakterden az olamaz.")
            } else
             {
                makeAlert(titleInput: "Hata", messageInput: "Email Adresiniz ya da Şifreniz Geçersiz.")
            }
            
            
        }
        
        
    }

    

    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toForgotVC", sender: nil)
    }
    
    @IBAction func showpassClicked(_ sender: Any) {
        
        passwordText.isSecureTextEntry.toggle()
        if let textRange = passwordText.textRange(from: passwordText.beginningOfDocument, to: passwordText.endOfDocument) {
            passwordText.replace(textRange, withText: passwordText.text!)
          }
    }
    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

