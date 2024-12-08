//
//  BuyingButtonsView.swift
//  HomeWork6SU
//
//  Created by Daria Kolpakova on 07.12.2024.
//

import SwiftUI

struct BuyingButtonsView: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Buy On Credit").padding(8.0).foregroundColor(.green)
            }.padding(4.0).frame(maxWidth: .infinity).background(
                RoundedRectangle(cornerRadius: 10.0, style: .continuous).stroke(.gray, lineWidth: 1.0)
            )
            Divider()
            HStack{
                Button(action: {}) {
                    Image(systemName: "scalemass").padding().foregroundColor(.gray)
                }
                Button(action: {}) {
                    Image(systemName: "cart").padding().foregroundColor(.gray)
                }
                Button(action: {}) {
                    Image(systemName: "heart").padding().foregroundColor(.gray)
                }
                Spacer()
                Button(action: {}) {
                    Text("Buy Now")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                }
            }
        }
    }
}
