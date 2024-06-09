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
        VStack {
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
            }
        }
        .scrollContentBackground(.hidden)
    }

    private func instructionsView() -> some View {
        ScrollView {
            Text(meal.instructions)
                .padding()
                .lineSpacing(12.0)
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
