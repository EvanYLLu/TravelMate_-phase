//
//  TextField.swift
//  finwork
//
//  Created by admin on 2021/12/3.
//

import Foundation
import UIKit

extension UITextField {
    func setNumberKeyboardReturn(){
        /*
        //設定寬度
        let width = Float(UIScreen.main.bounds.width)
        //設定ToolBar大小及位置
        let accessoryView = UIToolbar(frame: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(0.1 * width)))
        //設定UIBarButtonItem
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //設定Done鍵的動作
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(selectDoneButton))
        //設定ToolBar
        accessoryView.items = [space,done,space]
        //加入畫面
        self.inputAccessoryView = accessoryView
         */ func selectDoneButton(){
             self.resignFirstResponder()
         }
}
    
    //呼叫收起鍵盤的函式
    
}
