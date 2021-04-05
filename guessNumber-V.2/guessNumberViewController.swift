//
//  guessNumberViewController.swift
//  guessNumber-V.2
//
//  Created by Ryan Chang on 2021/4/5.
//

import UIKit

class guessNumberViewController: UIViewController {

    @IBOutlet weak var staesLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var guessNumberTextField: UITextField!
    
    var max = Int()
    var min = Int()
    var times = Int()
    var rightnumber = Int()
    //多宣告三個變數來存一開始的設定值
    var maxx = Int()
    var minn = Int()
    var timess = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        maxLabel.text = "最大值:\(max)"
        minLabel.text = "最小值:\(min)"
        timesLabel.text = "剩餘:\(times)次"
        rightnumber = Int.random(in: min...max)
        maxx = max
        minn = min
        timess = times
        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func guessButton(_ sender: UIButton) {
        if let guesstext = guessNumberTextField.text,
           let guessN = Int(guesstext){
            print(rightnumber)
            
            if guessN > max || guessN < min {
                staesLabel.text = "請輸入範圍之內的數字，\(min)~\(max)"
                times -= 1
                timesLabel.text = "剩餘:\(times)次"
            }else if guessN > rightnumber {
                max = guessN
                times -= 1
                staesLabel.text = "太大了"
                maxLabel.text = "最大值:\(max)"
                timesLabel.text = "剩餘:\(times)次"
            }else if guessN < rightnumber {
                min = guessN
                times -= 1
                staesLabel.text = "太小了"
                minLabel.text = "最小值:\(min)"
                timesLabel.text = "剩餘:\(times)次"
            }else if guessN == rightnumber{
                finish("恭喜你！！")
            }
            if times == 0 {
                finish("你沒機會啦...")
            }
        }
        guessNumberTextField.text = ""
    }
    
    //這裡重置會將一開始額外存的數據丟回去
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    
    
    
    //重置function，把一開始的設定值存回去
    func reset(){
        min = minn
        max = maxx
        times = timess
        maxLabel.text = "最大值:\(max)"
        minLabel.text = "最小值:\(min)"
        timesLabel.text = "剩餘:\(times)次"
        staesLabel.text = ""
        rightnumber = Int.random(in: min...max)
    }
    
    //結束的alert的function
    func finish(_ title:String) {
         let alart = UIAlertController(title: title, message: "答案是\(rightnumber)", preferredStyle: .alert)
         let action = UIAlertAction(title: "Again", style: .default, handler: { action in self.reset() })
         //呼叫alart
         alart.addAction(action)
         present(alart, animated: true, completion: nil)
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
