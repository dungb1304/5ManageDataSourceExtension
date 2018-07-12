//
//  ViewController.swift
//  5ManageDataSourceExtension
//
//  Created by DungB96 on 2018/05/29.
//  Copyright © 2018 DungB96. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = Array(1...5)
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainView : ViewController?
    
    var dataSource = DataSource()
    
    var hasNoData : Bool = true {
        didSet{
            hasNoData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = footerView)
        }
    }
    
    
    @IBAction func changeData(_ sender: UISwitch) {
        if sender.isOn {
            tableView.dataSource = dataSource
            hasNoData = dataSource.list.count == 0
        }else{
            tableView.dataSource = self
            hasNoData = number.count == 0
        }
        
        tableView.reloadData()
    }
    
    @IBOutlet weak var switchButton: UISwitch!
    
    
    @IBOutlet var noDataView: UIView!
    
    
    @IBOutlet weak var footerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        mainView = self
        dataSource.mainView = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ManagerViewController {
            if let index = tableView.indexPathForSelectedRow {
                if switchButton.isOn {
                    viewController.getData = dataSource.list[index.row]
                }else{
                    viewController.getData = String(number[index.row])
                }
            }
            
        }
    }
    
    
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        if let viewController = unwindSegue.source as? ManagerViewController{
            if let index = tableView.indexPathForSelectedRow{
                if switchButton.isOn {
                    dataSource.list[index.row] = viewController.getData ?? ""
                }else{
                    number[index.row] = Int(viewController.getData ?? "") ?? 0
                }
            }else{
                if switchButton.isOn {
                    dataSource.list.append(viewController.getData ?? "")
                    noDataView.isHidden = true
                }else{
                    number.append(Int(viewController.getData ?? "") ?? 0)
                    noDataView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }
    
    
    
}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = String(number[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            number.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            mainView?.hasNoData = number.count == 0
        }else if editingStyle == .insert {
            
        }
    }
}
