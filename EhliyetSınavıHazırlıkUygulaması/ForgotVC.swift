//
//  ForgotVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 8.08.2021.
//

import UIKit
import Parse
class ForgotVC: UIViewController {

    @IBOutlet weak var forgotEmailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetPasswordClicked(_ sender: Any) {
        
        if isValidEmail(forgotEmailText.text!) == true && forgotEmailText.text != nil  &&  forgotEmailText.text != ""  {
            
            PFUser.requestPasswordResetForEmail(inBackground: forgotEmailText.text!) { block, error in
                
                if error != nil {
                    
                    self.makeAlert(titleInput: "Hata", messageInput: "Şifre sıfırlama başarısız.Lütfen email adresinizi kontrol ediniz.")
                }
                else {
                    self.makeAlertGoBack(titleInput: "Şifre Sıfırlama", messageInput: "Şifre sıfırlamak için gerekli bilgiler \(self.forgotEmailText.text!) mail adresinize gönderilmiştir")
                   
                }
                
            }
            
            
                    
                }else {
                    
                    self.makeAlert(titleInput: "Hata", messageInput: "Email adresi boş geçilemez. Geçerli bir email adresi giriniz.")
                   
                    
                }
        
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toSignVC", sender: nil)
        
    }
    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func makeAlertGoBack(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                                        self.seguehelp()})
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @objc func seguehelp() {
        
        self.performSegue(withIdentifier: "toSignVC", sender: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
