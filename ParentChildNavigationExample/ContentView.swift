//
//  ContentView.swift
//  ParentChildNavigationExample
//
//  Created by Russell Gordon on 2020-11-30.
//

import SwiftUI

// By conforming to the identifiable protocol, a type can be iterated over with the List view
struct Child: Identifiable {
    var id = UUID()         // Generate a unique identifier for an instance of this type
    var name: String
    var description: String
    var imageName: String
}

struct Parent {
    var name: String
    var children: [Child]
}

struct ContentView: View {
    
    // All top level options
    var topLevelOptions = [
        Parent(name: "Option 1", children: [
            
            Child(name: "Option 1a",
                  description: "Some explanatory information about option 1a",
                  imageName: "image1a"),
            Child(name: "Option 1b",
                  description: "Some explanatory information about option 1b",
                  imageName: "image1b"),
            Child(name: "Option 1a",
                  description: "Some explanatory information about option 1c",
                  imageName: "image1c"),

        ]),
        Parent(name: "Option 2", children: [

            Child(name: "Option 2a",
                  description: "Some explanatory information about option 2a",
                  imageName: "image2a"),
            Child(name: "Option 2b",
                  description: "Some explanatory information about option 2b",
                  imageName: "image2b"),

        ]),
        Parent(name: "Option 3", children: [

            Child(name: "Option 3a",
                  description: "Some explanatory information about option 3a",
                  imageName: "image3a"),
            Child(name: "Option 3b",
                  description: "Some explanatory information about option 3b",
                  imageName: "image3b"),
            Child(name: "Option 3c",
                  description: "Some explanatory information about option 3c",
                  imageName: "image3c"),
            Child(name: "Option 3d",
                  description: "Some explanatory information about option 3d",
                  imageName: "image3d"),

        ]),
    ]
    
    // Selected top level option
    @State var selectedTopLevelOption = 0
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    Picker("Select a top level option", selection: $selectedTopLevelOption) {
                        
                        ForEach(0 ..< topLevelOptions.count) { index in
                            
                            Text(topLevelOptions[index].name)
                            
                        }
                        
                    }

                }
                
                Section {
                    
                    // Loop over all the children of the selected top level option
                    List(topLevelOptions[selectedTopLevelOption].children) { secondLevelOption in
                        
                        Text(secondLevelOption.name)
                        
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
