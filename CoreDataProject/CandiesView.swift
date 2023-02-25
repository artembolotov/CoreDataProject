//
//  ItemsView.swift
//  CoreDataProject
//
//  Created by artembolotov on 24.02.2023.
//

import SwiftUI

struct CandiesView: View {
    @FetchRequest private var candies: FetchedResults<Candy>
    
    init(mode: Binding<FilterMode>, searchStr: Binding<String>) {
        self._candies = FetchRequest(
            sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)],
            predicate: searchStr.wrappedValue.isEmpty ? nil : NSPredicate(format: "name \(mode.wrappedValue.rawValue) %@", searchStr.wrappedValue)
        )
    }
    
    var body: some View {
        List {
            ForEach(candies, id: \.self) { candy in
                Text(candy.wrappedName)
            }
        }
        .listStyle(.plain)
        .resignKeyboardOnDragGesture()
    }
}
