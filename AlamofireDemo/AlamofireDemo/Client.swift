//
//  Client.swift
//  AlamofireDemo
//
//  Created by ZPC18-003 on 2020/9/29.
//

import Foundation
import Alamofire
class Client{    
    func test(){
        AF.request("https://httpbin.org/get").responseJSON{ response in
            debugPrint("Response: \(response)")
        }
        .responseString{
            response in
            debugPrint("String response :\(response)")
        }
   
    }
    
    func testBaidu(){
        AF.request("http://baidu.com").response { response in
            print(response.request!)
            print(response.response!)
            print(response.result)
            print(response.data!)
        }
    }
}
