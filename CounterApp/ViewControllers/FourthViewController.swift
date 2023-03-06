//
//  FourthViewController.swift
//  CounterApp
//
//  Created by Taichi Tsuchida on 2023/03/07.
//

import UIKit

class FourthViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let csvHeader = "name,x,y\r\n"
        let csvRow1 = "John,10,30\r\n"
        let csvRow2 = "Emily,20,50\r\n"
        
        let csvData = csvHeader + csvRow1 + csvRow2
        saveCsvFile(csvData: csvData)
    }
    
    // 入力されたデータをcsvファイルに保存する
    // ファイルアプリの"このiPhone内"フォルダ内の"CounterApp(アプリ名)"フォルダに保存される
    func saveCsvFile(csvData: String) {
        /*
         Info.plistに以下の2項目を追加する
         + Application supports iTunes file sharing : YES
         + Supports opening documents in place : YES
        */
        
        // Documentsディレクトリまでのパス
        guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = docURL.appendingPathComponent("sample.csv")
        
        // OutputStreamを使ってファイルに書き込む
        // (append: trueで既存ファイルに追記する、falseでファイルを上書きして書き込む)
        guard let stream = OutputStream(url: fileURL, append: true) else { return }
        stream.open()
        defer { stream.close() }
        
        // BOMと呼ばれる符号をファイル先頭に書き込む
        // (UTF-8でのBOMは3bytesなのでmaxLength: 3)
        let BOM = "\u{feff}"
        stream.write(BOM, maxLength: 3)
        
        // csvをUTF-8に変換する
        guard let csvBytes = csvData.data(using: .utf8) else { return }
        
        // csvデータを書き込む
        // (csvデータをUInt8型のバイト配列に変換したcsvBytesの先頭アドレス(baseAddress)を指定している)
        let _ = csvBytes.withUnsafeBytes {
            stream.write($0.bindMemory(to: UInt8.self).baseAddress!, maxLength: csvBytes.count)
        }
    }
}
