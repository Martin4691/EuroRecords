//
//  YearSelectorVC.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//

import Foundation
import UIKit


// -----> Traspasar al  archivo "YearSelectorCollectionVC":
class YearSelectorVC: UICollectionViewController {
    
    let yearList: [String] = ["2004", "2005", "2006", "2007", "2008", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"]
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "YearCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "YearCell")
        
        super.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yearList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "YearCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        if let yearCellConfig = (cell as? YearCell) {
            yearCellConfig.yearCellLabel.text = yearList[indexPath.row]
        } else {
            cell.backgroundColor = .black
        }
        return cell
    }
    
}

// Cell size:
extension YearSelectorVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 100
        let cellHeight = 100
        return CGSize(width: cellWidth, height: cellHeight)
    }
}


// Cell Selected:
//extension YearSelectorVC {
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        var yearSelected = yearList[indexPath.row]
//
//
//        performSegue(withIdentifier: "segueToDetail", sender: nil)
//    }
//}
//
