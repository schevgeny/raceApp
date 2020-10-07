//
//  ResultVC.swift
//  race
//
//  Created by Eugene sch on 8/20/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit

class ResultVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var tableView: UITableView?
    
    var result: String?
    
    var dataResults:[Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = result
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        let data = UserDefaults.standard.value([Result].self, forKey: "results")
        dataResults = data?.sorted(by: { $0.exp > $1.exp })
       // dataResults?.removeSubrange(5...)
     
    }
    @IBAction func restartAction(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell:ResultCell  = self.tableView?.dequeueReusableCell(withIdentifier: ResultCell.className, for: indexPath) as? ResultCell
        guard let tableView = self.tableView,
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
                return UITableViewCell()
        }
        
        cell.set(model: self.dataResults?[indexPath.row] ?? Result())
        return cell
    }
    
}
