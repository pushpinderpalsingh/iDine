//
//  ItemDetail.swift
//  iDine
//
//  Created by Pushpinder Pal Singh on 11/12/20.
//

import SwiftUI

struct ItemDetail: View {
    
    var item : MenuItem
    
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
            Spacer()
            
        }
        .navigationBarTitle(item.name,displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
