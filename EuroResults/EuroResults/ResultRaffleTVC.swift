//
//  ResultRaffleTVC.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//

import Foundation
import UIKit

class ResultRaffleTVC: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var labelBigBlack: UILabel!
    @IBOutlet weak var labelStar1: UILabel!
    @IBOutlet weak var labelStar2: UILabel!
    @IBOutlet weak var labelRaffleDate: UILabel!
    @IBOutlet weak var labelBlackLine: UILabel!
    @IBOutlet weak var labelNumberRaffle: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
