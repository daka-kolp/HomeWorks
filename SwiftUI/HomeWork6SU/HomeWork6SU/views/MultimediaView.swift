//
//  MultimediaView.swift
//  HomeWork6SU
//
//  Created by Daria Kolpakova on 07.12.2024.
//

import SwiftUI

struct MultimediaView: View {
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack (alignment: .center){
            Image("img")
                .resizable()
                .scaledToFit()
                .frame(height: width * 0.7, alignment: .center)
                .offset(x: width * 0.15)
            
            Text("-5%")
                .multilineTextAlignment(.center)
                .padding(24.0)
                .background(Circle().fill(.cyan))
                .offset(x: width * 0.4, y: -width * 0.3)
            
        }.frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
