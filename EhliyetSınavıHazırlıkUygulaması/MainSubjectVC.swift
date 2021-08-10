//
//  MainSubjectVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 10.08.2021.
//

import UIKit

class MainSubjectVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backSegue))
    }
    

    @objc func backSegue()  {
      
     performSegue(withIdentifier: "toSubVC", sender: nil)
     }
   

}
