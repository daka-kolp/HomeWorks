//
//  ProductInfoView.swift
//  HomeWork6SU
//
//  Created by Daria Kolpakova on 07.12.2024.
//

import SwiftUI

struct ProductInfoView: View {
    var body: some View {
        VStack {
            Text("Motherboard, Asus ROG Strix B550-E Gaming (s AM4, AMD B550, PCI-Ex16))")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.title3)
            
            HStack {
                Text("Code 218525893").font(.caption).foregroundColor(.gray)
                Spacer()
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    Image(systemName: "star").foregroundColor(.gray)
                    Text("54").font(.caption)
                }
            }
        }
    }
}

