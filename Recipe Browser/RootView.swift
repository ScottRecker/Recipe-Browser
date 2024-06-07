//
//  ContentView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import SwiftUI

struct RootView: View {
    @State var mealPreviews: MealList = .placeholder

    var body: some View {
        NavigationStack {
            List {
                ForEach(mealPreviews.meals, id: \.id) { mealPreview in
                    RecipeRowView(mealPreview: mealPreview)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle("Recipes")
                .onAppear() {
                    print("Fetching meal list...")
                }
            }
        }
    }
}

#Preview {
    RootView()
}
