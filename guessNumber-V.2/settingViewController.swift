//
//  settingViewController.swift
//  guessNumber-V.2
//
//  Created by Ryan Chang on 2021/4/5.
//

import UIKit

class settingViewController: UIViewController {

    
    @IBOutlet weak var maxTextField: UITextField!
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var timesTextField: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    

    var max = Int()
    var min = Int()
    var times = Int()
    
    //使用IBSegueAction來把數據丟到下一個view controller
    @IBSegueAction func settingOK(_ coder: NSCoder) -> guessNumberViewController? {
        let controller = guessNumberViewController(coder: coder)
        controller?.max = max
        controller?.min = min
        controller?.times = times
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一開始就先把textField補上數字
        reset()
    }
        
    @IBAction func startButton(_ sender: UIButton) {
        input()
        view.endEditing(true)
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
        stateLabel.text = ""
        view.endEditing(true)
    }
    
    //會使用預設值
    func reset(){
        times = 5
        max = 100
        min = 0
        maxTextField.text = String(max)
        minTextField.text = String(min)
        timesTextField.text = String(times)
    }
    
    //以下會把textField的數據判斷後再存起來
    func input() {
        if let maxtext = maxTextField.text,
           let mintext = minTextField.text,
           let timestext = timesTextField.text,
           let big = Int(maxtext),
           let small = Int(mintext),
           let count = Int(timestext){
            if big <= small || count <= 0 {
                stateLabel.text = "輸入錯誤，最大值不能小於等於最小值\n 或是 次數不能為0以下"
            }else {
                max = big
                min = small
                times = count
                stateLabel.text = ""
                
                //如果判斷數據沒問題，就會使用performSegue來跳到下一個view controller
                performSegue(withIdentifier: "setting", sender: nil)
            }
        }else {
            stateLabel.text = "請輸入數字，不能有小數點或是空白"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
