//
//  DonateViewController.swift
//  ScrollType
//
//  Created by Samantha Chang on 3/25/21.
//

import SwiftUI

struct DonateView: View {
    @Binding var showDonationView: Bool
    @ObservedObject var products = ProductsDB.shared
    
    var body: some View {
        Form {
            Section {
                VStack {
                    HStack {
                        Spacer()
                        
                        ZStack {
                            Circle()
                                .fill(Color.secondary)
                                .frame(width: 30, height: 30, alignment: .trailing)

                            Text("✕").foregroundColor(.white).onTapGesture {
                                showDonationView.toggle()
                            }
                        }
                        .padding(.top, 10)
                    }
                    
                    Image("80x")
                        .cornerRadius(15)
                        .padding(.top)
                    
                    Text("ScrollType")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Text("Hi there! I’m just one freshman high school student and aspiring programmer building ScrollType, and it would mean a lot to me if you consider buying me a snack sometime.")
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top)
                    
                    VStack {
                        HStack {
                            Text("☕️ Coffee")
                                .font(.title2)
                            
                            Spacer()
                            
                            /*Button(action: {
                                let _ = IAPManager.shared.purchase(product: self.products.items[0])
                            }) { Text("$1.99").fontWeight(.semibold).font(.title2).padding(11) }
                            .onAppear() {
                                IAPManager.shared.getProducts()
                            }*/
                            Text("$1.99").fontWeight(.semibold).font(.title2).padding(11)
                                .onAppear() {
                                    IAPManager.shared.getProducts()
                                }
                                .onTapGesture {
                                    let _ = IAPManager.shared.purchase(product: self.products.items[1])
                                }
                                .foregroundColor(.white)
                                .background(Color(red: 96/255, green: 114/255, blue: 150/255))
                                .cornerRadius(12)
                        }.padding(.top)
                        .padding(.bottom)
                        
                        /*HStack {
                            Text("☕️ Coffee ")
                                .font(.title2)
                            
                            Spacer()
                            
                            Button(action: {
                                let _ = IAPManager.shared.purchase(product: self.products.items[1])
                            }) { Text("$2.99").fontWeight(.semibold).font(.title2).padding(11) }
                            /*.onAppear() {
                                IAPManager.shared.getProducts()
                            }*/
                            .foregroundColor(.white)
                            .background(Color(red: 96/255, green: 114/255, blue: 150/255))
                            .cornerRadius(12)
                        }.padding(.top)
                        .padding(.bottom)
                        
                        HStack {
                            Text("🍔 Cheeseburger")
                                .font(.title2)
                            
                            Spacer()
                            
                            Button(action: {
                                let _ = IAPManager.shared.purchase(product: self.products.items[1])
                            }) { Text("$4.99").fontWeight(.semibold).font(.title2).padding(11) }
                            /*.onAppear() {
                                IAPManager.shared.getProducts()
                            }*/
                            .foregroundColor(.white)
                            .background(Color(red: 96/255, green: 114/255, blue: 150/255))
                            .cornerRadius(12)
                        }.padding(.top)
                        .padding(.bottom)*/
                    }
                }
            }
        }
    }
}
