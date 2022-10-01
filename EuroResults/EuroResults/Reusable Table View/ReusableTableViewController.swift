//
//  ReusableTableViewController.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//

import Foundation
import UIKit

private let reuseIdentifier = "basicCell"

class ReusableTableViewController: UITableViewController {

    var raffleList: [QueryModel]? = []
    var raffleSelected: QueryModel = QueryModel(page: 0, perPage: 0, total: 0, data: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationController?.isNavigationBarHidden = false
        
        raffleList?.sort {
            $0.data[0].sorteo < $1.data[0].sorteo
        }
        
        print("msm: ------> raffleList en viewDidLoad() => \(raffleList!.count)")
        
        
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return raffleList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell...
        if let raffleCellConfig = cell as? ResultRaffleTVC,
           let raffle: QueryModel = raffleList?[indexPath.row] {

            raffleCellConfig.label1.text = String(describing: raffle.data[0].resultado.bolas[0].numero)
            raffleCellConfig.label2.text = String(describing: raffle.data[0].resultado.bolas[1].numero)
            raffleCellConfig.label3.text = String(describing: raffle.data[0].resultado.bolas[2].numero)
            raffleCellConfig.label4.text = String(describing: raffle.data[0].resultado.bolas[3].numero)
            raffleCellConfig.label5.text = String(describing: raffle.data[0].resultado.bolas[4].numero)
            raffleCellConfig.labelStar1.text = String(describing: raffle.data[0].resultado.estrellas[0].numero)
            raffleCellConfig.labelStar2.text = String(describing: raffle.data[0].resultado.estrellas[1].numero)
            let date: String = String(raffle.data[0].fecha.dropLast(14))
            raffleCellConfig.labelRaffleDate.text = date
            raffleCellConfig.labelNumberRaffle.text = String(describing: raffle.data[0].sorteo)
            
        } else {
            cell.backgroundColor = .black
        }
        
        return cell
    }
    

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
