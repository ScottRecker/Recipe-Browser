//
//  SegmentedControlView.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/7/24.
//

import SwiftUI

struct SegmentedControlView: View {
    @State private var group = Group.ingredients
    @State var meal: Meal

    init(meal: Meal) {
        self.meal = meal
    }

    var body: some View {
        VStack(spacing: 0) {
            Picker("", selection: $group) {
                ForEach(Group.allCases) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                    
                }
            }
            .pickerStyle(.segmented)
            
            switch group {
            case .ingredients:
                ingredientsView()
            case .instructions:
                instructionsView()
                    .padding(.top, 4)
            }
        }
    }

    private func ingredientsView() -> some View {
        List {
            ForEach(meal.ingredients, id: \.ingredient) { item in
                HStack {
                    Text(item.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.1)
                }
                .listRowBackground(Color(.systemGray6))
                .listRowInsets(.init(top: 0,
                                     leading: 10,
                                     bottom: 0,
                                     trailing: 10))

            }
        }
        .contentMargins(.vertical, 4)
        .contentMargins(.horizontal, 4)
        .scrollContentBackground(.hidden)

    }

    private func instructionsView() -> some View {
        ScrollView {
            Text(meal.instructions)
                .padding()
                .lineSpacing(12.0)
                .background(Color(.systemGray6))
        }
    }

    private enum Group: String, CaseIterable, Identifiable {
        case ingredients
        case instructions
        
        var id: String { self.rawValue }
    }
}

#Preview {
    SegmentedControlView(meal: .placeholder)
}
