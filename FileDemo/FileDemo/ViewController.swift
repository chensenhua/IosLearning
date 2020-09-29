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
        let documentUrl = try?fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false).absoluteURL.path;
        printChildUrl(path: documentUrl!)
        
        let myDirectory:String = documentUrl! + "/test"
        do{
           try  fileManager.createDirectory(atPath: myDirectory, withIntermediateDirectories: true, attributes: nil)
        }catch  {
            print("create dir failed\(error)")
        }
        
        printChildUrl(path: documentUrl!)
        
        let filePath = myDirectory+"/test.txt";
        fileManager.createFile(atPath:filePath , contents: "test".data(using: .utf8), attributes: nil);
            
        printChildUrl(path: documentUrl!)
        
        if(fileManager.fileExists(atPath: filePath)){
            print("text.txt is exists")
        }
        
        if  let fileData = fileManager.contents(atPath: filePath){
            print("text.txt data is \(String.init(data: fileData, encoding: .utf8) ?? "nil")")
        }
        
        print("file display name is \(fileManager.displayName(atPath: filePath))")
        
        let filePath2 = myDirectory+"/test2.txt";
        try?fileManager.copyItem(at: URL(fileURLWithPath: filePath), to: URL(fileURLWithPath: filePath2))

        printChildUrl(path: documentUrl!)

        if  let fileData2 = fileManager.contents(atPath: filePath2){
            print("text2.txt data is \(String.init(data: fileData2, encoding: .utf8) ?? "nil")")
        }
 
   
        
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

