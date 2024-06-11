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
    var errorState: (showError: Bool, errorMessage: String) = (false, "Uh-oh")

    func fetchDessertDetails(mealId: String) async {
        do {
            let meal = try await RecipeService.getMealDetails(mealId: mealId)
            self.meal = meal
        } catch {
            errorState.errorMessage = error.localizedDescription
            errorState.showError = true
        }
    }

}
