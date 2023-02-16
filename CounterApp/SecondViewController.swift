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
        
        // UITapGestureRecognizerを定義する
        // ジェスチャが検知された時に呼ぶメソッド(ここではminus())を"#selector"を使ってactionに指定する
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(minus(sender:))
        )
        // 定義したUITapGestureRecognizerを、ジェスチャを検出させたいViewやOutletに追加する
        // label等のOutletでジェスチャを検出したい時には、Main.storyboardでlabel等のOutletを選択した状態で右サイドビューの"Attributes Inspector"を開き"User Interaction Enabled"にチェックを入れる
        label.addGestureRecognizer(tapGesture)
        // 画面全体でジェスチャを検出したい時
        // view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
    }
    
    // タップジェスチャが検知されたときに呼ばれるメソッド
    // UITapGestureRecognizerで使われるtarget-actionはSwiftではなくObjective-Cの仕組みであり、メソッドに"@objc"をつけることでその中でも呼べるようになる
    // 引数でUITapGestureRecognizerを受け取れる
    @objc func minus(sender: UITapGestureRecognizer) {
        number = number - 1
        label.text = String(number)
        
        // sender(UITapGestureRecognizer)からジェスチャ検知位置などの情報を受け取れる
        // var location = sender.location(in: view)
    }
}
