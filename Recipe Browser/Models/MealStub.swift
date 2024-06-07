//
//  Meal.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import Foundation

struct Response: Codable {
    let meals: [MealStub]
}

struct MealStub: Codable, Equatable {
    let meal: String
    let mealThumb: String
    let id: String

    private enum CodingKeys: String, CodingKey {
        case meal = "strMeal"
        case mealThumb = "strMealThumb"
        case id = "idMeal"
    }
}
