//
//  CheckoutView.swift
//  iDine
//
//  Created by Pushpinder Pal Singh on 19/01/21.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order : Order
    
    @State private var paymentType = 1
    @State private var addLoyaltyCard = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    static let tipAmounts = [10,15,20,25,0]
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?",selection: $paymentType){
                    ForEach(0 ..< Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
            }
                Toggle(isOn: $addLoyaltyCard, label: {
                    Text("Add iDine Loyalty Card")
                })
            if addLoyaltyCard {
                TextField("Enter your iDine id",text: $loyaltyNumber)
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage",selection: $tipAmount){
                    ForEach(0 ..< Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Total: $\(totalPrice,specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm Order"){
                    self.showingPaymentAlert.toggle()
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert, content: {
                Alert(title: Text("Order Confirmed"),message: Text("Your total was $\(totalPrice,specifier: "%.2f")"),dismissButton: .default(Text("OK")))
            })
    }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
