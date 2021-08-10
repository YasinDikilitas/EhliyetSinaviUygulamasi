//
//  AnnouncementVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 8.08.2021.
//

import UIKit
import Parse

class SubjectVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var lastExamsTableView: UITableView!
    @IBOutlet weak var lastExamsTableView2: UITableView!
    var arraySubject = ["İşaretler","Konu Anlatımı"]
    var selectedSubject = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lastExamsTableView.delegate = self
        lastExamsTableView.dataSource = self
        lastExamsTableView2.delegate = self
        lastExamsTableView2.dataSource = self
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOutButtonClicked))
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returncell = UITableViewCell()
        
        
        if tableView == self.lastExamsTableView {
                let cell = UITableViewCell()
                cell.textLabel?.text = "İşaretler"
                returncell = cell
            } else if  tableView == self.lastExamsTableView2 {
                let cell = UITableViewCell()
                cell.textLabel?.text = "Konu Anlatımı"
                returncell = cell
            }
        return returncell
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        
        if tableView == self.lastExamsTableView {
            self.selectedSubject = arraySubject[indexPath.row]
            self.performSegue(withIdentifier: "toTrafficSign", sender: nil)
            } else if  tableView == self.lastExamsTableView2 {
                self.selectedSubject = arraySubject[indexPath.row]
                self.performSegue(withIdentifier: "toSubjectContentVC", sender: nil)
            }
     
        
    }
    
    
    
    
    @objc func logOutButtonClicked () {
        
        self.makeAlert2(titleInput: "Çıkış", messageInput: "Çıkış Yapmak Istediğinize Emin misiniz?")
        
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
    @objc func backseg (){
        
        performSegue(withIdentifier: "toLastExamVC", sender: nil)
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

    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
}
