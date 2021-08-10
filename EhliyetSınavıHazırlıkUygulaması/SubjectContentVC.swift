//
//  SubjectContentVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 10.08.2021.
//

import UIKit

class SubjectContentVC: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    @IBOutlet weak var subjectTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Geri", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backSegue))
    }
    
    @objc func backSegue()  {
    tabbarcount.tabBarCount = 2
     performSegue(withIdentifier: "toSubjectBackVC", sender: nil)
    
     }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

                let cell = UITableViewCell()
                return cell
                
    
    }
}
