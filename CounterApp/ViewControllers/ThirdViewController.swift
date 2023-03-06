//
//  ThirdViewController.swift
//  CounterApp
//
//  Created by Taichi Tsuchida on 2023/03/02.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // 画面下部の小さいUIView
    @IBOutlet var controlView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面表示時はcontrolViewを非表示にする
        controlView.isHidden = true
    }
    
    @IBAction func play() {
        // ボタンタップでcontrolViewの表示非表示を切り替える
        // controlView.isHidden = !controlView.isHidden
        controlView.isHidden.toggle()
    }
}

