//
//  ViewController.swift
//  CounterApp
//
//  Created by Taichi Tsuchida on 2023/02/02.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    
    var colorNames = ["black", "red", "blue"]
    var colors = [UIColor.black, UIColor.red, UIColor.blue]
    
    // @IBOutletをつけることでMain.storyboard上の部品であるlabelとこのコード上のlabelを紐づけられる
    // Main.storyboardの右サイドビューの"Connections Inspector"にある"label"の右の丸からドラッグして画面上のlabelにつなげる
    @IBOutlet var label: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    
    // 画面(このViewController)が読み込まれた時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // selfはここだとViewControllerのこと．pickerViewでのデータの扱いや処理をViewControllerに委任している
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // @IBActionをつけることでbutton等で起こるアクション(タップ等)と紐づけられる
    // Main.storyboardの右サイドビューの"Connections Inspector"にある"plus"の右の丸からドラッグして画面上のbuttonにつなげる
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
    }
    
    // 画面遷移が起こるときに呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.number = number
            }
        }
    }
}

// DataSource (UIPickerViewでのデータの扱いをViewControllerに委任する)
extension ViewController: UIPickerViewDataSource {
    // PickerViewの列の数 numberOfComponents
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // PickerViewの行の数 numberOfRowsInComponent
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorNames.count
    }
}

// Delegate (UIPickerViewでの処理をViewControllerに委任する)
extension ViewController: UIPickerViewDelegate {
    // 行に表示するテキスト titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorNames[row]
    }
    
    // 行が選ばれた時 didSelectRow
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.textColor = colors[row]
    }
}
