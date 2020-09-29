//
//  AlamofireDemoTests.swift
//  AlamofireDemoTests
//
//  Created by ZPC18-003 on 2020/9/29.
//

import XCTest
import Foundation
 
@testable import AlamofireDemo

class AlamofireDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("==========test start ===============\n")
    }

    override func tearDownWithError() throws {
        print("==========test end ===============\n")    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
         startLoad()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
         
        }
    }
    
    
    func startLoad()  {
        let url = URL(string: "https://www.examplae.com/")!
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
        RunLoop.init().run()
    }

}
