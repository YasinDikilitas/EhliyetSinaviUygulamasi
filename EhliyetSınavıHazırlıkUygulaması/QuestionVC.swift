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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }

}
