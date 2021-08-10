//
//  SignCell.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 10.08.2021.
//

import UIKit

class SignCell: UITableViewCell {

    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signNameLabel: UILabel!
    @IBOutlet weak var signContentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
