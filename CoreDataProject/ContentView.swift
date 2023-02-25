//
//  ContentView.swift
//  CoreDataProject
//
//  Created by artembolotov on 18.02.2023.
//

import CoreData
import SwiftUI

enum FilterMode: String {
    case beginsWith = "BEGINSWITH[c]"
    case endsWith = "ENDSWITH[c]"
    case contains = "CONTAINS[c]"
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
//    @FetchRequest(
//        sortDescriptors: [],
//        predicate: NSPredicate(format: "name \(mode.rawValue) %@", seacrhString)
//    ) var countries: FetchedResults<Country>
    
    @State private var seacrhString = ""
    @State private var mode = FilterMode.beginsWith
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Picker("Select predicate", selection: $mode) {
                        Text("Begins With").tag(FilterMode.beginsWith)
                        Text("Ends With").tag(FilterMode.endsWith)
                        Text("Contains").tag(FilterMode.contains)
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Filter", text: $seacrhString)
                }
                .padding(.horizontal)
                
                CandiesView(mode: $mode, searchStr: $seacrhString)
                
                Button("Add Examples") {
                    let candy1 = Candy(context: moc)
                    candy1.name = "Mars"
                    candy1.origin = Country(context: moc)
                    candy1.origin?.shortName = "UK"
                    candy1.origin?.fullName = "United Kingdom"
                    
                    let candy2 = Candy(context: moc)
                    candy2.name = "KitKat"
                    candy2.origin = Country(context: moc)
                    candy2.origin?.shortName = "UK"
                    candy2.origin?.fullName = "United Kingdom"
                    
                    let candy3 = Candy(context: moc)
                    candy3.name = "Twix"
                    candy3.origin = Country(context: moc)
                    candy3.origin?.shortName = "UK"
                    candy3.origin?.fullName = "United Kingdom"
                    
                    let candy4 = Candy(context: moc)
                    candy4.name = "Toblerone"
                    candy4.origin = Country(context: moc)
                    candy4.origin?.shortName = "CH"
                    candy4.origin?.fullName = "Swithzerland"
        
                    try? moc.save()
                }
                .padding()
            }
            .navigationTitle("Candies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
