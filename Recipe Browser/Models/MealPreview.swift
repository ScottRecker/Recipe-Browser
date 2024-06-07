//
//  Meal.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import Foundation

struct MealList: Codable {
    let meals: [MealPreview]

    static let placeholder = MealList(meals: [
        MealPreview(mealTitle: "Blackwell Tart", mealThumb: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg", idMeal: "52767"),
        MealPreview(mealTitle: "Apple Frangipane Tart", mealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg", idMeal: "52768"),
        MealPreview(mealTitle: "Banana Pancakes", mealThumb: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg", idMeal: "52855")
    ])
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

    static let placeHolder = MealPreview(
        mealTitle: "Banana Pancakes",
        mealThumb: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
        idMeal: "52855"
    )
}

}
