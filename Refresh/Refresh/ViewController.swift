//
//  ViewController.swift
//  Refresh
//
//  Created by 姜守栋 on 2018/4/18.
//  Copyright © 2018年 Nick.Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.sd_header = RefreshHeader.header(with: {
            print("下拉刷新了吗")
        })

    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.section) @ \(indexPath.row)"
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let header = tableView.sd_header as? RefreshHeader {
            header.endRefreshing()
        }
    }
}
