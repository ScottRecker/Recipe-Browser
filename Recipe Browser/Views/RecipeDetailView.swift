//
//  RecipeDetailView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/7/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var model = RecipeDetailViewModel()

    var body: some View {
        VStack {
            Image(.bannanPancakes)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 200.0)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10.0)
                )
            VStack {
                SegmentedControlView(meal: .placeholder)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Banana Pancakes")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack {
        RecipeDetailView()
    }
}
