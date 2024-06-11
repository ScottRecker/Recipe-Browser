//
//  RecipeRowView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import SwiftUI

struct RecipeRowView: View {
    let mealPreview: MealPreview
    @State var viewModel = RecipeViewModel()

    var body: some View {
        VStack {
            if let uiImage = viewModel.uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .padding(5)
                    .frame(maxHeight: .imageHeight)
                    .clipShape(
                        RoundedRectangle(cornerRadius: .cornerRadius)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: .cornerRadius)
                            .fill(Color(.systemGray5))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: .cornerRadius)
                            .stroke(Color(.systemGray5))
                    )
            } else {
                ProgressView()
                    .padding(.vertical, 30)
            }
            Text(mealPreview.mealTitle)
                .bold()
                .padding(.leading, 20)
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .task {
            await downloadImage()
        }
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadius))
        .shadow(color: Color(.gray).opacity(0.1), radius: 5, x: 0, y: 10)
    }

    private func downloadImage() async {
        do {
            try await viewModel.fetchImage(url: mealPreview.mealThumb)
        } catch {
            print(error)
        }
    }
}

fileprivate extension CGFloat {
    static let width = 320.0
    static let imageHeight = 230.0
    static let cornerRadius = 10.0
}

#Preview {
    RecipeRowView(mealPreview: .placeHolder)
}
