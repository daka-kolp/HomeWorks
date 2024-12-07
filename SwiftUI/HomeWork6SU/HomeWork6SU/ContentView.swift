//
//  ContentView.swift
//  HomeWork6SU
//
//  Created by Daria Kolpakova on 07.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack (alignment: .leading) {
            MultimediaView()
            ProductInfoView()
            Divider()
            ProductPriceView()
            Divider()
            BuyingButtonsView()
            
        }.padding(16.0)
    }
}

#Preview {
    ContentView()
}
