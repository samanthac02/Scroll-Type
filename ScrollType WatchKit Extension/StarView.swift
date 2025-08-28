//
//  StarView.swift
//  ScrollType WatchKit Extension
//
//  Created by Samantha Chang on 1/19/21.
//

import SwiftUI

struct StarView: View {
    @State var isRecallViewPresented: Bool = false
    
    @Binding var isStarViewPresented: Bool
    @Binding var text: String
    
    var body: some View {
        Button(action: {
            
        }) { Text("Save") }
        
        Button(action: {
            self.isRecallViewPresented.toggle()
        }) { Text("Recall") }.sheet(isPresented: $isRecallViewPresented) {
            RecallView(isRecallViewPresented: $isRecallViewPresented)
        }
    }
}

struct RecallView: View {
    @Binding var isRecallViewPresented: Bool
    
    var body: some View {
        List {
            Text("Thank you, Egypt")
        }
    }
}
