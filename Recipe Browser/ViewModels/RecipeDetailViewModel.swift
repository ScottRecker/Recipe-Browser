//
//  RecipeDetailViewModel.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/10/24.
//

import SwiftUI

@Observable
final class RecipeDetailViewModel {
    var meal: Meal?
    private let imageLoader = ImageLoader()

    var uiImage: UIImage? {
        imageLoader.uiImage
    }

    var errorState: (showError: Bool, errorMessage: String) = (false, "Uh-oh")

    func fetchDessertDetails(mealId: String) async {
        do {
            let meal = try await RecipeService.getMealDetails(mealId: mealId)
            self.meal = meal
            try await fetchImage(url: meal.mealThumb)
        } catch {
            errorState.errorMessage = error.localizedDescription
            errorState.showError = true
        }
    }

    private func fetchImage(url: String) async throws {
        try await imageLoader.fetchImage(url: url)
    }

}
