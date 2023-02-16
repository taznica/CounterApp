//
//  SecondViewController.swift
//  CounterApp
//
//  Created by Taichi Tsuchida on 2023/02/09.
//

import UIKit

class SecondViewController: UIViewController {
    
    var number: Int = 0

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.text = String(number)
        
    }
    
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
    }
}
