//
//  LandScreenVC.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//

import Foundation
import UIKit


class LandScreenVC: UIViewController {
    @IBOutlet weak var allButton: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func fetchAll(_ sender: Any) {
    }
    
    
    @IBAction func fetchYears(_ sender: Any) {
    }
    
    
    @IBAction func fetchStyle(_ sender: Any) {
    }
    
    
}




