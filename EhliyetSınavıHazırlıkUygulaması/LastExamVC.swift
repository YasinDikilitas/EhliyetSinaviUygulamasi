//
//  LastExamVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 9.08.2021.
//

import UIKit

class LastExamVC: UIViewController {

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backSegue))
        // Do any additional setup after loading the view.
    }
    
   @objc func backSegue()  {
    
    
    tabbarcount.tabBarCount = 0
    performSegue(withIdentifier: "toBackVC", sender: nil)
    }
  

}
