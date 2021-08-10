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
    
    var examNameArray = [String]()
    var examNumberArray = [Int]()
    var examIdArray = [Int]()
   
    var selectedExamNumber = 0
    var selectedExamtype = "SpecialExam"
    var selectedExamName = ""
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.organize, target: self, action:  #selector(backseg))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logOutButtonClicked))
        tableView.delegate = self
        tableView.dataSource = self
        self.tabBarController?.selectedIndex = tabbarcount.tabBarCount
        getData()
    }
    
    @objc func backseg (){
        
        performSegue(withIdentifier: "toLastExamVC", sender: nil)
    }
    
    @objc func getData() {
        
        
        let query = PFQuery(className: "ExamType")
        query.addAscendingOrder("ExamNumber")
        query.whereKey("ExamType", equalTo: "Special")
        
        query.findObjectsInBackground { objects, error in
            
            
            if error != nil {
                self.makeAlert(titleInput: "Hata", messageInput: "Bağlantıda bir hata mevcut")
                
            }else {
                
                self.examIdArray.removeAll(keepingCapacity: false)
                self.examNameArray.removeAll(keepingCapacity: false)
                self.examNumberArray.removeAll(keepingCapacity: false)
               
                if objects!.count > 0 {
                    
                    for object in objects! {
                        
                        self.examIdArray.append(object.object(forKey: "Id") as! Int)
                        self.examNameArray.append(object.object(forKey: "ExamName") as! String)
                        self.examNumberArray.append(object.object(forKey: "ExamNumber") as! Int)
                        
                    }
                    
                    
                    
                    
                }
                
                self.tableView.reloadData()
                
                
                
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examIdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = examNameArray[indexPath.row]
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedExamNumber = examNumberArray[indexPath.row]
        self.selectedExamName = examNameArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "toDetailsVC" {
            let  destinationVC = segue.destination as! DetailsVC
            
            destinationVC.chosenExamNumber = self.selectedExamNumber
            destinationVC.chosenExamType = self.selectedExamtype
            destinationVC.chosenExamName = self.selectedExamName
            
            
        }
        
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
