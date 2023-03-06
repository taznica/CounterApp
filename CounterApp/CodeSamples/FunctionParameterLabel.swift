//
//  FunctionParameterLabel.swift
//  CounterApp
//
//  Created by Taichi Tsuchida on 2023/02/16.
//

import Foundation

func main() {
    function1(num: 10)
    function2(number: 10)
    function3(10)
    function4(userId: 10, userName: "John")
}

func function1(num: Int) {
    print(num)
}

// 左側の引数名(ここでいうnumber)：外部引数名。この関数を外部から呼び出すときに使う引数の名前
// 右側の引数名(ここでいうnum)   ：内部引数名。この関数の{}内で引数を使うときの名前
func function2(number num: Int) {
    print(num)
}

// 外部引数名にハイフンを指定することで、関数呼び出し時に引数名を記述することを省略できる
func function3(_ num: Int) {
    print(num)
}

func function4(userId id: Int, userName name: String) {
    print(id, name)
}
