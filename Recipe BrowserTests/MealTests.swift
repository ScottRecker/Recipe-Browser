//
//  Recipe_BrowserTests.swift
//  Recipe BrowserTests
//
//  Created by Scott Recker on 6/6/24.
//

import XCTest
@testable import Recipe_Browser

final class MealTests: XCTestCase {

    func testMealStub() throws {
        let decoder = JSONDecoder()
        let response = try! decoder.decode(MealsResponse.self, from: mealListData)
        XCTAssertEqual(response.meals.count, 3)
        XCTAssertEqual(response.meals[0].idMeal, "53049")
    }

    func testMeal() throws {
        let decoder = JSONDecoder()
        let meals = try decoder.decode(Meals.self, from: mealDetailData)
        print(meals.meals[0].ingredients)
        XCTAssertEqual(meals.meals.count, 1)
        XCTAssertEqual(meals.meals[0].idMeal, "52893")
        XCTAssertEqual(meals.meals[0].ingredients.count, 9)
    }
}    

// JSON Data (as Data)
fileprivate let mealListData = """
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

fileprivate let mealDetailData = """
{
  "meals": [
    {
      "idMeal": "52893",
      "strMeal": "Apple & Blackberry Crumble",
      "strDrinkAlternate": null,
      "strCategory": "Dessert",
      "strArea": "British",
      "strInstructions": "Heat oven to 190C/170C fan/gas 5...",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
      "strTags": "Pudding",
      "strYoutube": "https://www.youtube.com/watch?v=4vhcOwVBDO4",
      "strIngredient1": "Plain Flour",
      "strIngredient2": "Caster Sugar",
      "strIngredient3": "Butter",
      "strIngredient4": "Braeburn Apples",
      "strIngredient5": "Butter",
      "strIngredient6": "Demerara Sugar",
      "strIngredient7": "Blackberrys",
      "strIngredient8": "Cinnamon",
      "strIngredient9": "Ice Cream",
      "strIngredient10": "",
      "strIngredient11": "",
      "strIngredient12": "",
      "strIngredient13": "",
      "strIngredient14": "",
      "strIngredient15": "",
      "strIngredient16": "",
      "strIngredient17": "",
      "strIngredient18": "",
      "strIngredient19": "",
      "strIngredient20": "",
      "strMeasure1": "120g",
      "strMeasure2": "60g",
      "strMeasure3": "60g",
      "strMeasure4": "300g",
      "strMeasure5": "30g",
      "strMeasure6": "30g",
      "strMeasure7": "120g",
      "strMeasure8": "¼ teaspoon",
      "strMeasure9": "to serve",
      "strMeasure10": "",
      "strMeasure11": "",
      "strMeasure12": "",
      "strMeasure13": "",
      "strMeasure14": "",
      "strMeasure15": "",
      "strMeasure16": "",
      "strMeasure17": "",
      "strMeasure18": "",
      "strMeasure19": "",
      "strMeasure20": "",
      "strSource": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    }
  ]
}
""".data(using: .utf8)!

