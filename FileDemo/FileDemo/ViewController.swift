//
//  ViewController.swift
//  FileDemo
//
//  Created by ZPC18-003 on 2020/9/29.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fileManager = FileManager.default;
        let documentUrl = try?fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).absoluteString;
        printChildUrl(path: documentUrl!)
        
        let myDirectory:String = NSHomeDirectory() + "/Documents/myFolder/Files"
        do{
            try  fileManager.createDirectory(atPath: myDirectory, withIntermediateDirectories: true, attributes: nil)
        }catch  {
            print("create dir failed")
        }
        
        printChildUrl(path: NSHomeDirectory() )
            
            
            
        
    }
    
    
    func printChildUrl(path:String)  {
        let fileManager = FileManager.default;
         print("path : \(path)")
        fileManager.enumerator(atPath: path)?.forEach{
            children in
            print("document child url:\(children)")
        }
    }


}

