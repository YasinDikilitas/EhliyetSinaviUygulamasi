//
//  MainPageVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 8.08.2021.
//

import UIKit
import Parse
class MainPageVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOutButtonClicked))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
        
    }
    
    @objc func logOutButtonClicked () {
        
        self.makeAlert2(titleInput: "Çıkış", messageInput: "Çıkış Yapmak Istediğinize Emin misiniz?")
        
    }
    
    
    
    
    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    func makeAlert2(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let yesButton = UIAlertAction(title: "Evet", style: UIAlertAction.Style.default, handler:{ action in
            self.logout()})
        let noButton = UIAlertAction(title: "Hayır", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @objc func logout() {
        PFUser.logOutInBackground { error in
            
            if error != nil {
               
                self.makeAlert(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata")
                
            }
            
            else {
                
                self.performSegue(withIdentifier: "toSignUpPageVC", sender: nil)
                
            }
            
        }

}

}
