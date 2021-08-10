//
//  CellVC.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 8.08.2021.
//

import UIKit

class CellVC: UITableViewCell,UITableViewDelegate,UITableViewDataSource {

 
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var cellTableView: UITableView!
    var aChoice = ""
    var bChoice = ""
    var cChoice = ""
    var dChoice = ""
    var arrayChoice = [String]()
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellTableView.delegate = self
        cellTableView.dataSource = self
        
        arrayChoice = [aChoice,bChoice,cChoice,dChoice]
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayChoice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell2 = cellTableView.dequeueReusableCell(withIdentifier: "CellSmall", for: indexPath) as! CellSmallVC
        cell2.cellLabel!.text = arrayChoice[indexPath.row]
        return cell2
        
        
    }
    
    
}
