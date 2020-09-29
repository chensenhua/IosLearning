//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by ZPC18-003 on 2020/9/29.
//

import UIKit

struct  Order : Codable{
    let customerId:String
    let items:[String]
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        startLoad()
//        postTest()
        testFileSystem()
    }
    
    
    func testFileSystem(){
        let fileManage = FileManager.default
        
        print("home dir:\(NSHomeDirectory())")
        print("user name:\(NSUserName())")
        print("full user name:\(NSFullUserName())")
        print("home dir for user:\(String(describing: NSHomeDirectoryForUser(NSUserName())))")
        print("temporary url dir:\(fileManage.temporaryDirectory)")
        
        print("temporary  dir:\(NSTemporaryDirectory())")
        
        let homeUrl = try?fileManage.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create: false)
        print("home url :\(homeUrl)")
        
        var  urls = fileManage.urls(for: .picturesDirectory, in: .allDomainsMask)
        urls.forEach{
            url in
            print("url :\(url)")
        }
        
        let   urls1 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        urls1.forEach{
            url in
            print("url1 :\(url)")
        }
        
        print("ooen stop root dir:\(NSOpenStepRootDirectory())")
        
        try?fileManage.contentsOfDirectory(atPath:NSOpenStepRootDirectory()).forEach{
            children in
            print("child url:\(children)")
        }
      
     
      
    }

    func startLoad()  {
        let url = URL(string: "https://www.example.com/")!
        let task = URLSession.shared.dataTask(with: url){ data,response,error in
            if let error = error {
                print("requset failed \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else{
                print("requset failed \(response)")
                return
            }
            let value=data!
            print(String(data:value,encoding: .utf8))
        }
        task.resume()
    }
    
    func  postTest()  {
        let url = URL(string: "https://example.com/post")!
        var request  = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let order = Order(customerId:"12345",items:["test1","test2"])
        guard let uploadData = try? JSONEncoder().encode(order) else {
            return
        }
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData){
            data,response,error in
            if let error = error {
                print("error: \(error)")
            }
            
            print("response   :  \(response)")
            
            guard let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) else{
                print("server error :")
                return
            }
            
            print("got data :\(String(data:data!,encoding: .utf8))")
        }
        task.resume()
    }
}


