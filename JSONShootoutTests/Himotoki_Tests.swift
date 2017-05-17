//
//  Himotoki_Tests.swift
//  JSONShootout
//
//  Created by orakaro on 2017/05/17.
//  Copyright © 2017 SwiftBit. All rights reserved.
//

import XCTest
import ModelObjects
import Himotoki

class Himotoki_Tests: XCTestCase {
    
    func testDeserialization() {
        self.measure {
            let d:NSDictionary = try! JSONSerialization.jsonObject(with: self.data as Data, options: []) as! NSDictionary
            XCTAssert(d.count > 0)
        }
    }
    
    func testPerformance() {
        let dict = try! JSONSerialization.jsonObject(with: self.data as Data, options: []) as! NSDictionary
        
        self.measure {
            let result: [Program] = try! decodeArray(dict, rootKeyPath: ["ProgramList", "Programs"])
            XCTAssert(result.count > 1000)
        }
    }
    
    
    private lazy var data:Data = {
        let path = Bundle(for: type(of: self)).url(forResource: "Large", withExtension: "json")
        let data = try! Data(contentsOf: path!)
        return data
    }()
    
}
