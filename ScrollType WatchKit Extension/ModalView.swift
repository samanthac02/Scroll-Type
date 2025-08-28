//
//  OptionsView.swift
//  ScrollType WatchKit Extension
//
//  Created by Samantha Chang on 1/18/21.
//

import SwiftUI

struct ModalView: View {
    @Binding var showModal: Bool
    @Binding var characters: [ String ]
    @Binding var characterStatus: String
    @Binding var moreButtonText: String
    @Binding var textBoxText: String
    @Binding var text: String
    
    var body: some View {
        List {
            ZStack(alignment: .center) {
                if textBoxText.isEmpty { Text("Emojis").foregroundColor(.white) }
                TextField("", text: $textBoxText)
                    .onChange(of: textBoxText, perform: { value in
                        text.append(textBoxText)
                        textBoxText = ""
                        self.showModal = false
                }).multilineTextAlignment(.center)
            }.cornerRadius(20)
            
            HStack {
                Spacer()
                Text("Capitals").onTapGesture {
                    characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
                    characterStatus = "capitals"
                    moreButtonText = "abc"
                    self.showModal.toggle()
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Numbers").onTapGesture {
                    characters = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "/", ":", ";", "(", ")", "$", "&", "@", "\"", ".", ",", "?", "!", "'", ""]
                    characterStatus = "numbers"
                    moreButtonText = "abc"
                    self.showModal.toggle()
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Symbols").onTapGesture {
                    characters = [".", ",", "?", "!", "'", "\"", "[", "]", "{", "}", "#", "%", "^", "*", "+", "=", "_", "\\", "|", "~" , "<", ">", "€", "£", "¥", "•"]
                    characterStatus = "symbols"
                    moreButtonText = "abc"
                    self.showModal.toggle()
                }
                Spacer()
            }
            
            
        }
    }
}
