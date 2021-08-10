//
//  QuestionVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 8.08.2021.
//

import UIKit
import Parse

class QuestionVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var questionTableView: UITableView!
    var examNameNormalArray = [String]()
    var examNumberNormalArray = [Int]()
    var examIdNormalArray = [Int]()
    var selectedNormalExamType = "Exam"
    
    var selectedNormalExamNumber = 0
    var selectedNormalExamName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOutButtonClicked))
        questionTableView.delegate = self
        questionTableView.dataSource = self
        NormalGetData()
    }
    
    @objc func NormalGetData() {
        
        
        let query = PFQuery(className: "ExamType")
        query.addAscendingOrder("ExamNumber")
        query.whereKey("ExamType", equalTo: "Normal")
        
        query.findObjectsInBackground { objects, error in
            
            
            if error != nil {
                self.makeAlert(titleInput: "Hata", messageInput: "Bağlantıda bir hata mevcut")
                
            }else {
                
                self.examIdNormalArray.removeAll(keepingCapacity: false)
                self.examNumberNormalArray.removeAll(keepingCapacity: false)
                self.examNameNormalArray.removeAll(keepingCapacity: false)
               
                if objects!.count > 0 {
                    
                    for object in objects! {
                        
                        self.examIdNormalArray.append(object.object(forKey: "Id") as! Int)
                        self.examNameNormalArray.append(object.object(forKey: "ExamName") as! String)
                        self.examNumberNormalArray.append(object.object(forKey: "ExamNumber") as! Int)
                        
                    }
                    
                    
                    
                    
                }
                
                self.questionTableView.reloadData()
                
                
                
            }
            
        }
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examIdNormalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = examNameNormalArray[indexPath.row]
        return cell
    }
    
    @objc func backseg (){
        
        performSegue(withIdentifier: "toLastExamVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedNormalExamNumber = examNumberNormalArray[indexPath.row]
        self.selectedNormalExamName = examNameNormalArray[indexPath.row]
        self.performSegue(withIdentifier: "toNormalDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "toNormalDetailsVC" {
            let  destinationVC = segue.destination as! DetailsVC
            
            destinationVC.chosenExamNumber = self.selectedNormalExamNumber
            destinationVC.chosenExamType = self.selectedNormalExamType
            destinationVC.chosenExamName = self.selectedNormalExamName
            
            
        }
        
    }
    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
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
