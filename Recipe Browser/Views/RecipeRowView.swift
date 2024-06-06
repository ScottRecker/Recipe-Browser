//
//  RecipeRowView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/6/24.
//

import SwiftUI

struct RecipeRowView: View {
    var body: some View {
        VStack {
            Image(.bannanPancakes)
                .resizable()
                .scaledToFill()
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
                .padding(5)
            Text("Banna Pancakes")
                .bold()
                .padding(.leading, 20)
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: .cornerRadius))
        .shadow(color: Color(.gray).opacity(0.1), radius: 5, x: 0, y: 10)
    }
}

fileprivate extension CGFloat {
    static let width = 320.0
    static let imageHeight = 230.0
    static let cornerRadius = 10.0
}

#Preview {
    RecipeRowView()
}
