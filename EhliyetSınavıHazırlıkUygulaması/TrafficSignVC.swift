//
//  TrafficSignVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 10.08.2021.
//

import UIKit

class TrafficSignVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var signTableView: UITableView!
 
    var chosenSubject = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signTableView.delegate = self
        signTableView.dataSource = self
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backSegue))
    }
    
    @objc func backSegue()  {
    tabbarcount.tabBarCount = 2
       // self.tabBarController?.selectedIndex = 2
     performSegue(withIdentifier: "toSubjectVC", sender: nil)
     }
   
    
    @objc func getSignData() {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

                let cell = tableView.dequeueReusableCell(withIdentifier: "SignCell") as! SignCell
                return cell
                
    
    }

    
    
    
    func makeAlert(titleInput : String , messageInput : String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    

        

}
