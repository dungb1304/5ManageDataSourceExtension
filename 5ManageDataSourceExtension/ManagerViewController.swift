//
//  ManagerViewController.swift
//  5ManageDataSourceExtension
//
//  Created by DungB96 on 2018/05/29.
//  Copyright © 2018 DungB96. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {

    var getData : String?
    
    
    @IBOutlet weak var inputField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if getData != nil {
            inputField.text = getData
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        getData = inputField.text
    }
    

}
