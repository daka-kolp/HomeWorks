//
//  ProductPriceView.swift
//  HomeWork6SU
//
//  Created by Daria Kolpakova on 07.12.2024.
//

import SwiftUI

struct ProductPriceView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text("1000").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title3)
                Text("$")
            }
            HStack{
                Text("Pisk up from store  - ")
                Text("FREE").foregroundColor(.green)
            }
            Text("Pick up tomorrow 7pm").font(.caption).foregroundColor(.gray)
        }
    }
}
