//
//  CollectionView.swift
//  HomeWork12SU
//
//  Created by Daria Kolpakova on 02.01.2025.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(0..<25, id: \.self) { index in
                    CardCell(index: index)
                }
            }.padding()
        }
    }
}
