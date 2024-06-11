//
//  RecipeViewModel.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/9/24.
//

import Foundation
import SwiftUI

@Observable
class RecipeViewModel {
    private var meals = [MealPreview]()
    var errorState: (showError: Bool, errorMessage: String) = (false, "Uh-oh")
    private let imageLoader = ImageLoader()

    var uiImage: UIImage? {
        imageLoader.uiImage
    }
    
    var sortedMeals: [MealPreview] {
        return meals.sorted(by: { lhs, rhs in
            return lhs.mealTitle < rhs.mealTitle
        })
    }

    func fetchDessertPreviews() async {
        do {
            let meals = try await RecipeService.getMealPreviews()
            self.meals = meals
        } catch {
            errorState.errorMessage = error.localizedDescription
            errorState.showError = true
        }
    }

    func refreshDessertPreviews() async {
        do {
            self.meals = [MealPreview]()
            let meals = try await RecipeService.getMealPreviews()
            self.meals = meals
        } catch {
            errorState.errorMessage = error.localizedDescription
            errorState.showError = true
        }
    }

    func fetchImage(url: String) async throws {
        try await imageLoader.fetchImage(url: url)
    }

}
