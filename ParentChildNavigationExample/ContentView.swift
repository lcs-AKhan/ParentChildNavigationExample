//
//  ContentView.swift
//  ParentChildNavigationExample
//
//  Created by Russell Gordon on 2020-11-30.
//

import SwiftUI

struct Parent {
    var description: String
}

struct ContentView: View {
    
    // All top level options
    var topLevelOptions = [
        Parent(description: "Option 1"),
        Parent(description: "Option 2"),
        Parent(description: "Option 3"),
    ]
    
    // Selected top level option
    @State var selectedTopLevelOption = 0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Picker("Select a top level option", selection: $selectedTopLevelOption) {
                    
                    ForEach(0 ..< topLevelOptions.count) { index in
                        
                        Text(topLevelOptions[index].description)
                        
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
