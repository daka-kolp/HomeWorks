//
//  CardCell.swift
//  HomeWork12SU
//
//  Created by Daria Kolpakova on 02.01.2025.
//

import SwiftUI

struct CardCell: View {
    let index: Int
    
    var body: some View {
        VStack {
            Image("image")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Item \(index)")
        }
    }
}
