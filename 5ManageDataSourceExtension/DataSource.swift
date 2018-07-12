//
//  DataSource.swift
//  5ManageDataSourceExtension
//
//  Created by DungB96 on 2018/05/29.
//  Copyright © 2018 DungB96. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    var list = ["One","Two","Three","Four","Five"]
    
    var mainView : ViewController?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            mainView?.hasNoData = list.count == 0
            
        }else if editingStyle == .insert {
            
        }
    }
}
