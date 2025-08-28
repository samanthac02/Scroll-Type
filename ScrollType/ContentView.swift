//
//  ContentView.swift
//  ScrollType
//
//  Created by Samantha Chang on 1/18/21.
//

import SwiftUI
import AVKit
import StoreKit

let defaults = UserDefaults.standard

struct ContentView: View {
    @State var isPro: Bool = defaults.bool(forKey: "isPro")
    var connectivityViewModel = MessageListViewModel()
    @State private var isReachable = "NO"
    @ObservedObject var viewModel = ViewModel()
    @Environment(\.openURL) var openURL
    @State var showDonationView: Bool = false
    @State var purchased: Bool = false
    @ObservedObject var products = ProductsDB.shared
    
    var body: some View {
        NavigationView {
            /*ZStack {
                    Image("yoda")
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .offset(y: 72)
                }.border(Color.black)
                .cornerRadius(20)
                .shadow(radius: 30)
                .padding()*/
            
            Form {
                /*Section {
                    
                    VStack(alignment: .center) {
                        Text("buy")
                            .font(.headline)
                            .padding(.top)

                        Divider()
                        
                        Image("yoda")
                            .frame(width: 300, alignment: .center)
                            .cornerRadius(20)
                            .padding(.bottom)
                            .onAppear() {
                                IAPManager.shared.getProducts()
                            }
                            .onTapGesture {
                                /*if isPro == true {
                                    self.connectivityViewModel.sendMessage()
                                } else {
                                    //print(products.items)
                                    let _ = IAPManager.shared.purchase(product: self.products.items[0])
                                }*/
                                //defaults.setValue(false, forKey: "isPro")
                                //print(isPro)
                                //self.connectivityViewModel.sendMessage()
                                let _ = IAPManager.shared.purchase(product: self.products.items[0])
                            }
                    }
                }*/
                
                Section {
                    
                    VStack(alignment: .center) {
                        Text("Tip Jar")
                            .font(.headline)
                            .padding(.top)

                        Divider()
                        
                        Image("yoda drawing")
                            //.resizable()
                            .frame(width: 300, alignment: .center)
                            .cornerRadius(20)
                            .padding(.bottom)
                            .onTapGesture {
                                showDonationView.toggle()
                            }
                            .sheet(isPresented: $showDonationView) {
                                DonateView(showDonationView: $showDonationView)
                            }
                    
                        Text("Hi there! I’m just one freshman high school student and aspiring programmer building ScrollType, and it would mean a lot if you consider buying me a coffee sometime.")
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top)
                            .padding(.bottom)
                    }
                }
                
                Section {
                    
                    VStack(alignment: .center) {
                        Text("App has been installed! 😄")
                            .font(.headline)
                            .padding(.top)

                        Divider()
                        
                        Image("Untitled_Artwork")
                            .frame(width: 300, alignment: .center)
                            .cornerRadius(20)
                            .padding(.bottom)
                    }
                }

                Section {
                    VStack(alignment: .leading) {
                        Text("TYPING")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)

                        Text("Never Before Seen Scrolling Feature!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(height: 60)
                            .padding(.bottom)
                        
                        HStack (alignment: .center) {
                            Spacer()
                            
                            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video", withExtension: "mov")!))
                                .frame(width: 300, height: 180, alignment: .center)
                                .cornerRadius(20)
                                .padding(.bottom)
                        
                            Spacer()
                        }
                        
                        List {
                            Text("• Use the Digital Crown or your finger to scroll through the letters")
                            
                            Divider()
                            
                            Text("• Tap the '•••' button to switch between capitals, numbers, symbols, emojis and more")
                            
                            Divider()
                            
                            Text("• Tap the space bar twice for period")
                                .padding(.bottom, 10)
                        }
                    }
                }

                
                Section {
                    VStack(alignment: .leading) {
                        Text("TIPS")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)

                        Text("Quick Switch and Watch Face Shortcut")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(height: 60)
                            .padding(.bottom)
                        
                        HStack {
                            Spacer()
                            
                            Image("Untitled_Artwork 3")
                                .frame(width: 300, alignment: .center)
                                .cornerRadius(20)
                                .padding(.bottom)
                            
                            Spacer()
                        }

                        List {
                            Text("• Add ScrollType as a shortcut on your Watch face to quickly and easily open the app")
                            
                            Divider()
                            
                            Text("• Use the side button on your watch to switch back to ScrollType after sending your message")
                                .padding(.bottom, 10)
                        }
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("OTHER APPS YOU MIGHT LIKE")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)

                        Text("ScrollTask")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(height: 60)
                            .padding(.bottom)
                        
                        /*Text("OTHER APPS YOU MIGHT LIKE 😀")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)

                        Text("ScrollTask")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(height: 60)
                            //.padding(.bottom)*/
                        
                        HStack {
                            Spacer()
                            
                            Image("c")
                                .frame(width: 300, alignment: .center)
                                .cornerRadius(20)
                                .padding(.bottom)
                            
                            Spacer()
                        }
                        
                        Text("Standalone to-do list app on Apple Watch. No need for iPhone.")
                        
                        HStack {
                            Spacer()
                            
                            Image("appStore")
                                .padding(.bottom)
                                .onTapGesture {
                                    openURL(URL(string: "itms-apps://itunes.apple.com/app/1550485375")!)
                                }
                            Spacer()
                        }
                        
                        
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        /*Text("HELP")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)*/

                        Text("Need Help?")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(height: 60)
                        
                        WebView(url: .publicUrl, viewModel: viewModel).overlay (
                            RoundedRectangle(cornerRadius: 4, style: .circular)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .frame(height: 350)
                        .padding()
                    }
                }
            }

            
            .navigationTitle("ScrollType")
            .onAppear() {
                if let windowScene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: windowScene) }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
