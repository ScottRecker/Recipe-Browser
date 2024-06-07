//
//  Meal.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let idMeal: String
    let meal: String
    let drinkAlternate: String?
    let category: String
    let area: String
    let instructions: String
    let mealThumb: String
    let tags: String?
    let youtubeUrl: String?
    let sourceUrl: String?
    let imageSource: String?
    let creativeCommonsConfirmed: Bool?
    let dateModified: Date?
    let ingredients: [(String, String)]

    enum CodingKeys: String, CodingKey {
        case idMeal
        case meal = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case mealThumb = "strMealThumb"
        case tags = "strTags"
        case youtubeUrl = "strYoutube"
        case sourceUrl = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"

        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        idMeal = try container.decode(String.self, forKey: .idMeal)
        meal = try container.decode(String.self, forKey: .meal)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        mealThumb = try container.decode(String.self, forKey: .mealThumb)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtubeUrl = try container.decodeIfPresent(String.self, forKey: .youtubeUrl)
        sourceUrl = try container.decodeIfPresent(String.self, forKey: .sourceUrl)
        imageSource = try? container.decodeIfPresent(String.self, forKey: .imageSource)
        creativeCommonsConfirmed = try? container.decodeIfPresent(Bool.self, forKey: .creativeCommonsConfirmed)
        dateModified = try? container.decodeIfPresent(Date.self, forKey: .dateModified)

        var tempIngredients = [(String, String)]()
        for i in 1...20 {
            let ingredientKey = CodingKeys(stringValue: "strIngredient\(i)")
            let measureKey = CodingKeys(stringValue: "strMeasure\(i)")
            guard let ingredientKey, let measureKey else { fatalError("Failed to create coding key") }

            let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey) ?? ""
            let measure = try container.decodeIfPresent(String.self, forKey: measureKey) ?? ""
            if !ingredient.isEmpty && !measure.isEmpty {
                tempIngredients.append((ingredient, measure))
            }
        }
        ingredients = tempIngredients
    }
}
