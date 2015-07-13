//
//  ViewController.swift
//  RamenTimerSwift
//
//  Created by MAEDAHAJIME on 2015/07/09.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbTimer: UILabel!
    
    let noodleTime: NSTimeInterval = 60 * 3  // カップラーメンの出来上がり時間 60秒×3
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func countDown(sender: UIButton) {
        
        self.lbTimer.text = "01:00:000"
        
        // 背景色
        self.view.backgroundColor = UIColor.yellowColor()
        
        // タイマー生成、開始 １秒後の実行
        var tmr = NSTimer.scheduledTimerWithTimeInterval(
            0.001,                              // 時間間隔
            target: self,                       // タイマーの実際の処理の場所
            selector: Selector("tickTimer:"),   // メソッド タイマーの実際の処理
            userInfo: nil,
            repeats: true)                      // 繰り返し
    }

    // タイマー処理
    func tickTimer(timer: NSTimer) {
    
        //NSLog(@"タイマー表示");
        
        // 時間書式の設定
        let df:NSDateFormatter = NSDateFormatter()
        df.dateFormat = "mm:ss:SSS"
        
        // 基準日時の設定 ３分を日付型に変換
        var dt:NSDate = df.dateFromString(self.lbTimer.text!)!
        
         // 基準となる時間間隔0
        //var dt2 = NSDate()
        var dt2 = 60 * 3
        //var dt2:NSDate = NSDate(timeIntervalSinceNow:noodleTime)
        
//        NSDate *dt2 = [NSDate dateWithTimeInterval:-0.010// 基準となる時間間隔
//            sinceDate:dt];
        
        self.lbTimer.text = df.stringFromDate(dt2)

        // 終了判定 3分が00:00になったら isEqualToString:文字の比較
        if ([self.lbTimer.text == "00:00:000"] == true) {
            
            // バックアップ背景色の変更
            self.view.backgroundColor = UIColor.redColor()
            
            // タイマーの停止
            timer.invalidate()
        }
    }
}

