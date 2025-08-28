//
//  Settings.swift
//  ScrollType
//
//  Created by Samantha Chang on 1/19/21.
//

import SwiftUI

struct Settings: View {
    @State var isAutoCapitalizaion: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle(isOn: $isAutoCapitalizaion, label: {
                        Text("Auto Capitalization")
                    })
                    
                    Toggle(isOn: $isAutoCapitalizaion, label: {
                        Text("Auto Correction")
                    })
                }
                
                Section {
                    HStack {
                        Text("Version")
                        
                        Spacer()
                        
                        Text("2.0").foregroundColor(.gray)
                    }
                }
                
                Section {
                    NavigationLink(destination: List {
                        Text("hello")
                        Text("jello")
                        Text("yello")
                    }) {
                        Text("Saved Messages")
                    }
                }
                
                Section {
                    Text("Thank you, Egypt")
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}
