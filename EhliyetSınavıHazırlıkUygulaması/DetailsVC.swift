//
//  DetailsVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 8.08.2021.
//

import UIKit
import Parse

class DetailsVC: UIViewController {

    var chosenExamNumber = 0
    var chosenExamType = ""
    var chosenExamName = ""
    
    var questionArray = [String]()
    var questionNumberArray = [Int]()
    var questionNumber = 1
    @IBOutlet weak var examNameLabel: UILabel!
    var aArray = [String]()
    var bArray = [String]()
    var cArray = [String]()
    var dArray = [String]()
    
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backSegue))
        examNameLabel.text = chosenExamName
        questionNumberLabel.text = String(questionNumber)
        getDetailsData()
     
        
    }
    
    @objc func backSegue() {
        
        performSegue(withIdentifier: "toVCSpecial", sender: nil)
        
    }
    
    
    @objc func getDetailsData()  {
        
        

        let  query = PFQuery(className: chosenExamType)
        query.addAscendingOrder("QuestionNumber")
        query.whereKey("ExamNumber", equalTo: chosenExamNumber)
        query.whereKey("QuestionNumber", equalTo: questionNumber)
        
        query.findObjectsInBackground { objects, error in
            
            
            if error != nil {
                self.makeAlert(titleInput: "Hata", messageInput: "Bağlantıda bir hata mevcut")
                
            }else {
                
                self.questionArray.removeAll(keepingCapacity: false)
                self.questionNumberArray.removeAll(keepingCapacity: false)
                self.aArray.removeAll(keepingCapacity: false)
                self.bArray.removeAll(keepingCapacity: false)
                self.cArray.removeAll(keepingCapacity: false)
                self.dArray.removeAll(keepingCapacity: false)
               
                if objects!.count > 0 {
                    
                    for object in objects! {
                        
                        self.questionArray.append(object.object(forKey: "Question") as! String)
                        self.questionNumberArray.append(object.object(forKey: "QuestionNumber") as! Int)
                        self.aArray.append(object.object(forKey: "A") as! String)
                        self.bArray.append(object.object(forKey: "B") as! String)
                        self.cArray.append(object.object(forKey: "C") as! String)
                        self.dArray.append(object.object(forKey: "D") as! String)
                        
                        
                        
                    }
                    
                    self.aLabel.text = self.aArray[0]
                    self.bLabel.text = self.bArray[0]
                    self.cLabel.text = self.cArray[0]
                    self.dLabel.text = self.dArray[0]
                    self.questionLabel.text = self.questionArray[0]
                    
                }
                
                
                
                
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
