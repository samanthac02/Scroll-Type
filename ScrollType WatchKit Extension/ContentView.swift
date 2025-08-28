//
//  ContentView.swift
//  ScrollType WatchKit Extension
//
//  Created by Samantha Chang on 1/18/21.
//

import SwiftUI

let defaults = UserDefaults.standard

struct ContentView: View {
    var viewModel = AnimalListViewModel()
    @State var characters: [ String ] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    @State var text: String = ""
    
    @State var textBoxText: String = ""
    
    @State private var showModal: Bool = false
    @State var characterStatus: String = "letters"
    @State var moreButtonText: String = "•••"
    @State var checkMessageLength: Int = 1
    
    @State var previousCharacter = ""
    @State var currentCharacter = ""
    @State var isNextLetterCapitalized: Bool = false

    @State var isStarViewPresented: Bool = false
    @State var isPro: Bool = defaults.bool(forKey: "isPro")
    
    var body: some View {
        let safeText = text.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        NavigationView {
            HStack {
                VStack() {
                    ZStack (alignment: .topLeading) {
                        Rectangle()
                            .fill(Color.black)
                        Text(text) + Text("|").foregroundColor(.blue).bold()
                    }.onLongPressGesture {
                        print("long")
                        if isPro == true {
                            self.isStarViewPresented.toggle()
                        }
                    }.sheet(isPresented: $isStarViewPresented) {
                        StarView(isStarViewPresented: $isStarViewPresented, text: $text)
                    }

                    VStack {
                        HStack {
                            Button(action: {
                                if characterStatus == "letters" {
                                    self.showModal.toggle()
                                } else {
                                    moreButtonText = "•••"
                                    characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
                                    characterStatus = "letters"
                                }
                            }) {
                                Text(moreButtonText).bold()
                            }.sheet(isPresented: $showModal) { ModalView(showModal: self.$showModal, characters: $characters, characterStatus: $characterStatus, moreButtonText: $moreButtonText, textBoxText: $textBoxText, text: $text) }
                            
                            Button(action: {
                                self.text.append(" ")
                                
                                if text.contains("  ") {
                                    text = text.replacingOccurrences(of: "  ", with: ". ", options: .literal, range: nil)
                                    previousCharacter = "."
                                } else { previousCharacter = currentCharacter }
                                
                                currentCharacter = " "
                                checkForCapitalize()
                            }) { Image("space") }
                        }
                        
                        HStack {
                            Button(action: {
                                let url = URL(string: "sms:&body=\(safeText)")!
                                WKExtension.shared().openSystemURL(url)
                                text = ""
                            }) { Label("", systemImage: "message.fill") }
                            
                            Button(action: {
                                if checkMessageLength > 0 {
                                    self.text.remove(at: self.text.index(before: self.text.endIndex))
                                }
                                checkMessageLength = text.count
                            }) { Text("del").bold() }
                        }
                    }
                }
                
                Spacer()
                
                List {
                    VStack {
                        ForEach(0..<characters.count) { index in
                            Text(characters[index])
                                .font(.largeTitle)
                                .onTapGesture {
                                    text.append(characters[index])
                                    text = text.firstCapitalized
                                    
                                    previousCharacter = currentCharacter
                                    currentCharacter = characters[index]
                                    capitalize(number: index)
                                }
                        }
                    }
                }.frame(width: 50)
            }.edgesIgnoringSafeArea(.bottom)
        }.navigationTitle("ScrollType")
    }
    
    func checkForCapitalize() {
        if previousCharacter == "." || previousCharacter == "!" || previousCharacter == "?" {
            if currentCharacter == " " {
                isNextLetterCapitalized = true
            }
        }
    }

    func capitalize(number: Int) {
        checkForCapitalize()
        if isNextLetterCapitalized == true {
            text.remove(at: text.index(before: text.endIndex))
            text.append(characters[number].firstCapitalized)
            isNextLetterCapitalized = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
