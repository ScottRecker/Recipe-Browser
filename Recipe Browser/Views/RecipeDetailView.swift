//
//  RecipeDetailView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/7/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var meal: MealPreview
    @State private var viewModel = RecipeDetailViewModel()

    var body: some View {
        VStack {
            if let url = meal.mealThumbUrl {
            AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 200.0)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    case .failure:
                        Image(systemName: "photo")
                        Text(phase.error?.localizedDescription ?? "Failed to load image")
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                ProgressView()
            }

            VStack {
                SegmentedControlView(meal: viewModel.meal)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.meal?.meal ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $viewModel.errorState.showError) {
            Alert(
                title: Text("Uh Oh 😕"),
                message: Text(viewModel.errorState.errorMessage),
                dismissButton: .default(Text("Ok"))
            )
        }
        .task {
            await viewModel.fetchDessertDetails(mealId: meal.idMeal)
        }
    }
}


#Preview {
    NavigationStack {
        RecipeDetailView(meal: .placeHolder)
    }
}
