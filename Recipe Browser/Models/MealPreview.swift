//
//  Meal.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import Foundation

struct MealList: Codable {
    let meals: [MealPreview]
}

struct MealPreview: Codable, Equatable {
    let mealTitle: String
    let mealThumb: String
    let idMeal: String

    private enum CodingKeys: String, CodingKey {
        case mealTitle = "strMeal"
        case mealThumb = "strMealThumb"
        case idMeal
    }
}
