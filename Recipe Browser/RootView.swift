//
//  ContentView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import SwiftUI

struct RootView: View {
    @State var viewModel = RecipeViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.sortedMeals, id: \.id) { mealPreview in
                    NavigationLink {
                        RecipeDetailView(meal: mealPreview)
                    } label: {
                        RecipeRowView(mealPreview: mealPreview)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Recipes")
            }
            .alert(isPresented: $viewModel.errorState.showError) {
                Alert(
                    title: Text("Uh Oh 😕"),
                    message: Text(viewModel.errorState.errorMessage),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .task {
               await viewModel.fetchDessertPreviews()
            }
            .refreshable {
                await viewModel.refreshDessertPreviews()
            }
        }
    }
}

#Preview {
    RootView()
}
