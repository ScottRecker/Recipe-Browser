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
    let ingredients: [(ingredient: String, measurement: String)]

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

extension Meal {
    internal init(
        idMeal: String,
        meal: String,
        drinkAlternate: String? = nil,
        category: String,
        area: String,
        instructions: String,
        mealThumb: String,
        tags: String? = nil,
        youtubeUrl: String? = nil,
        sourceUrl: String? = nil,
        imageSource: String? = nil,
        creativeCommonsConfirmed: Bool? = nil,
        dateModified: Date? = nil,
        ingredients: [(
            String,
            String
        )]
    ) {
        self.idMeal = idMeal
        self.meal = meal
        self.drinkAlternate = drinkAlternate
        self.category = category
        self.area = area
        self.instructions = instructions
        self.mealThumb = mealThumb
        self.tags = tags
        self.youtubeUrl = youtubeUrl
        self.sourceUrl = sourceUrl
        self.imageSource = imageSource
        self.creativeCommonsConfirmed = creativeCommonsConfirmed
        self.dateModified = dateModified
        self.ingredients = ingredients
    }

    static let placeholder = Meal(
        idMeal: "52855",
        meal: "Banana Pancakes",
        category: "Dessert",
        area: "American",
        instructions: "In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.\r\nHeat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter, spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the remaining oil and batter. Top the pancakes with the pecans and raspberries.",
        mealThumb: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
        ingredients: [
            ("Banana", "1 large"),
            ("Eggs", "2 medium"),
            ("Baking Powder", "pinch"),
            ("Vanilla Extract", "spinkling"),
            ("Oil", "1 tsp"),
            ("Pecan Nuts", "25g"),
            ("Raspberries", "125g")
        ]
    )
}
