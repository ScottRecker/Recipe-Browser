//
//  ContentView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        List {
            ForEach(0..<12) { _ in
                RecipeRowView()
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Recipies")
    }
}

#Preview {
    NavigationStack {
        RootView()
    }
}
