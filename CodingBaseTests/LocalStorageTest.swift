//
//  ModelTest.swift
//  CodingBaseTests
//
//  Created by Yangsheng Zou on 2020-02-06.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import XCTest
@testable import CodingBase
class ModelTest: XCTestCase {

    let storage = LocalStorage.sharedInstance
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    struct testStruct: Codable {
        var id: Int
        var value: String
        
        
        init(id: Int, value: String) {
            self.id = id
            self.value = value
        }
    }
    
    func testStorage() {
        let object3 = TemplateModel(id: 11, title: "xyz", numbers: [12,23], dict: ["x":1, "y":2])
        let object2 = "123"
        let object1 = 111
        let object0 = testStruct(id: 0, value: "11")
    
        testRemove(object: object2, key: .id)
        testRemove(object: object1, key: .id)
        testRemove(object: object3, key: .id)
        
        
        testEquitableStroage(object: object3, key: .template)
        testEquitableStroage(object: object2, key: .template)
        testEquitableStroage(object: object1, key: .template)
        
        
       
        testNonEquitableStroage(object: object0, key: .template)
    }
    
    func testNonEquitableStroage<T: Codable>(object: T, key: LocalStorage.Item) {
        print(object)
        storage.removeData(in: key)
        let nullObject: T? = storage.retrieve(item: key)
        XCTAssert(nullObject == nil)
        storage.save(value: object, to: key)
        let savedObject: T? = storage.retrieve(item: key)
        XCTAssert(savedObject != nil)
    }
   

    func testEquitableStroage<T: Codable & Equatable>(object: T, key: LocalStorage.Item){
        print("equ: \(object)")
        storage.removeData(in: key)
        let nullObject: T? = storage.retrieve(item: key)
        XCTAssert(nullObject == nil)
        storage.save(value: object, to: key)
        let savedObject: T? = storage.retrieve(item: key)
        XCTAssert(savedObject == object)
    }
    
    func testRemove<T:Codable>(object: T, key: LocalStorage.Item)  {
        storage.save(value: object, to: key)
        let savedObject: T? = storage.retrieve(item: key)
        XCTAssert(savedObject != nil)
        storage.removeData(in: key)
        let deletedObject: T? = storage.retrieve(item: key)
        XCTAssert(deletedObject == nil)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
