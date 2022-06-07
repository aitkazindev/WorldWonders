//
//  WonderListTableViewController.swift
//  WorldWonders
//
//  Created by Ibrahim Aitkazin on 07.06.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class WonderListTableViewController: UITableViewController {
    var isLoading: Bool = false
    var wondersArray: [Wonder] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(self.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        tableView.addSubview(self.refreshControl!)
        downloadData()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl?) {
        if !isLoading {
            isLoading = true
            wondersArray.removeAll()
            tableView.reloadData()
            downloadData()
        }
    }
  

    func downloadData(){
        SVProgressHUD.show()
        
        AF.request("https://demo7529813.mockable.io/getWonders").responseJSON{
            
            response in
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.value!)
                print(json)
                
                
                if let reaultArray = json.array {
                    for item in reaultArray {
                        let wItem = Wonder(json: item)
                        self.wondersArray.append(wItem)
                    }
                    self.tableView.reloadData()
                }
                    
                self.isLoading = false
                SVProgressHUD.dismiss()
                self.refreshControl?.endRefreshing()
            }
            
            else{
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "Error")
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wondersArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WonderTableViewCell
        
        cell.setupData(wonder: wondersArray[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
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
