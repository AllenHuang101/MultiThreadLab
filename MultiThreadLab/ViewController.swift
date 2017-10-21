//
//  ViewController.swift
//  MultiThreadLab
//
//  Created by allen3_huang on 21/10/2017.
//  Copyright © 2017 allen3_huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //concurrentLab()
        //serialLab()
        
        let q = DispatchQueue.global()
        q.async {
            self.semaphoreLab(task: "task1")
        }
        q.async {
            self.semaphoreLab(task: "task2")
        }
        
    }
    
    let semaphore = DispatchSemaphore(value: 1)
    
    func semaphoreLab(task: String){
       
        
        for i in 1...10{
            print("\(task) block1:\(i)")
        }
        
        //一次只允許一個執行緒進入執行
        //等待，直到Dispatch Semaphore的计数值 >= 1
        semaphore.wait()
        
        for j in 1...10{
            print("\(task) block2:\(j)")
        }
        
        semaphore.signal()
        
    }
    /**
     Concurrent 佇列可以容納多個執行緒，async() 區塊內的函式會讓
     iOS 產生一個新的執行緒來執行區塊內的程式碼
     block1執行完後，同時執行block2 & block3
     */
    func concurrentLab(){
        let q = DispatchQueue.global()
        
        //block1
        q.sync {
            for i in 1...10 {
                print("block1:\(i)")
            }
        }
        
        //block2
        q.async {
            for i in 11...20{
                print("block2:\(i)")
            }
        }
        
        //block3
        q.async {
            for i in 21...30 {
                print("block3:\(i)")
            }
        }
    }
    
    /**
     Serial 佇列，同一個佇列中的程式碼都是在同一個執行緒中執行，
     不同Serial 佇列的程式才會在不同執行緒中執行。
     block1 & block3 同時執行，block2 等block1 執行完後才執行。
    */
    func serialLab(){
        let q1 = DispatchQueue(label: "q1")
        let q2 = DispatchQueue(label: "q2")
        
        //block1
        q1.async {
            for i in 1...10{
                  print("block1:\(i)")
            }
        }
        
        //block2
        q1.async {
            for i in 11...20{
                  print("block2:\(i)")
            }
        }
        
        //block3
        q2.async {
            for i in 21...30{
                  print("block3:\(i)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

