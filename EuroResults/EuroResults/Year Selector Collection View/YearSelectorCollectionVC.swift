//
//  YearSelectorCollectionVC.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//


import UIKit
import Foundation

private let reuseIdentifier = "YearCell"

class YearSelectorCollectionVC: UICollectionViewController {
    
    let yearList: [String] = ["2004", "2005", "2006", "2007", "2008", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"]
    
    // List per year:
    var rafflesList: [QueryModel] = []
    
    
    var queryModel: QueryModel = QueryModel(page: 0, perPage: 0, total: 0, data: [])
    var resultModel: Resultado = Resultado(bolas: [], estrellas: [])
    var raffleNumber: Int = 1
    var yearNumber: Int = 2004
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        let nib = UINib(nibName: "YearCell", bundle: nil)
        self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
       
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    //MARK: func Call -> Raffles per year:
    func getRaffles(year: Int, completion: @escaping ((QueryModel) -> Void)) {
        var nSorteo: Int = 0
        
        for raffle in 1...105 {
            FetchsModels.fetchRaffleInfo(yearSelected: year, raffleNumber: raffle, success: { response in
                self.queryModel = response ?? QueryModel(page: 0, perPage: 0, total: 0, data: [])
                print("msm: response number \(raffle) success")
                nSorteo = raffle
                
                if !self.queryModel.data.isEmpty {
                    print("msm: year => \(self.queryModel.data[0].anyo), sorteo => \(self.queryModel.data[0].sorteo)")
                    self.rafflesList.append(self.queryModel)
                    self.queryModel = QueryModel(page: 0, perPage: 0, total: 0, data: [])
                } else {
                    print("msm: El sorteo Nº \(nSorteo) esta vacío o no se realizó en el año \(year).")
                }
                
                completion(self.queryModel)
                
            }, failure: {
                print("msm: response number \(raffle) failure ")
                return
            })
        }
    }
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
         if let destinationVC = segue.destination as? ReusableTableViewController { destinationVC.raffleList = self.rafflesList
         }
         
     }
     
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return yearList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let yearCellConfig = (cell as? YearCell) {
            yearCellConfig.yearCellLabel.text = yearList[indexPath.row]
                
        } else {
            cell.backgroundColor = .black
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}


// Cell Selected:
extension YearSelectorCollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("msm: Resultados del año \(self.yearList[indexPath.row])")
        
        
            self.getRaffles(year: Int(self.yearList[indexPath.row]) ?? 0) { response in
            print("msm: TOTAL RAFFLES IN RAFLES rafflesList = \(self.rafflesList.count)")

        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.performSegue(withIdentifier: "segueToDetailCVCCell", sender: nil)
        }
        

    }
    
    
}

/*
extension YearSelectorCollectionVC: UICollectionViewDelegateFlowLayout {
    // Method to configure cells wich adapt to any device width:
        private func configureSize(numOfHorizontalCells: CGFloat, marginBetweenCells: CGFloat) {
            
            guard let layout = collectionView.collectionViewLayout as? UICollectionViewDelegateFlowLayout else { return}
            
            let totalMarginBetweenCells: CGFloat = marginBetweenCells * (numOfHorizontalCells - 1)
            
            let marginPerCell: CGFloat = totalMarginBetweenCells / numOfHorizontalCells
            
            
            
            let cellWidth = frameWidth / numOfHorizontalCells - marginPerCell
            
            let cellHeight = cellWidth
            
//            layout.minimumLineSpacing = 0
    //        layout.minimumInterSpacing = 0
    //
    //        layout.estimatedItemSize = .zero
    //        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    //
        }

}
 */
