//
//  DiscoverVC.swift
//  FindBarber
//
//  Created by Reus on 13/11/17.
//  Copyright © 2017 Reus. All rights reserved.
//

import UIKit

class DiscoverVC: UIViewController {

    @IBOutlet weak var tblDiscover: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set tbl data source and delegate
        self.tblDiscover.dataSource  = self
        self.tblDiscover.delegate    = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// tbl - DataSource and Delegates

extension DiscoverVC:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellDiscover = tableView.dequeueReusableCell(withIdentifier: String(describing:DiscoverTblCell.self)) as! DiscoverTblCell
        
        cellDiscover.loadBarberColletiondata()
        
        return cellDiscover
    }
    
}
