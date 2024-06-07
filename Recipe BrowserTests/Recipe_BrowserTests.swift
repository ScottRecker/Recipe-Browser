//
//  Recipe_BrowserTests.swift
//  Recipe BrowserTests
//
//  Created by Scott Recker on 6/6/24.
//

import XCTest
@testable import Recipe_Browser

final class Recipe_BrowserTests: XCTestCase {
    
    let jsonData = """
    {
      "meals": [
        {
          "strMeal": "Apam balik",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
          "idMeal": "53049"
        },
        {
          "strMeal": "Apple & Blackberry Crumble",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
          "idMeal": "52893"
        },
        {
          "strMeal": "Apple Frangipan Tart",
          "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
          "idMeal": "52768"
        }
      ]
    }
    """.data(using: .utf8)!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let decoder = JSONDecoder()
        let response = try! decoder.decode(Response.self, from: jsonData)
//        print(response)
        XCTAssertEqual(response.meals.count, 3)
        XCTAssertEqual(response.meals[0].id, "53049")
    }

}
