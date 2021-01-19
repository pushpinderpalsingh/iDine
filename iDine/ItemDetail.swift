//
//  ItemDetail.swift
//  iDine
//
//  Created by Pushpinder Pal Singh on 11/12/20.
//

import SwiftUI

struct ItemDetail: View {
    
    var item : MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -20)
            }
            Text(item.description)
                .multilineTextAlignment(.center)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
            
        }
        .navigationBarTitle(item.name,displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
