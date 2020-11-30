//
//  ContentView.swift
//  ParentChildNavigationExample
//
//  Created by Russell Gordon on 2020-11-30.
//

import SwiftUI

struct Parent {
    var name: String
}

struct ContentView: View {
    
    // All top level options
    var topLevelOptions = [
        Parent(name: "Option 1"),
        Parent(name: "Option 2"),
        Parent(name: "Option 3"),
    ]
    
    // Selected top level option
    @State var selectedTopLevelOption = 0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Picker("Select a top level option", selection: $selectedTopLevelOption) {
                    
                    ForEach(0 ..< topLevelOptions.count) { index in
                        
                        Text(topLevelOptions[index].name)
                        
                    }
                    
                }
                
            }
            .navigationTitle("Parent-Child Nav")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
