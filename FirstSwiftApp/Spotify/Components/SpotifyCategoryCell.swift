//
//  SpotifyComponentCell.swift
//  FirstSwiftApp
//
//  Created by APPLE on 25/02/2025.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title:String = "All"
    var isSelected:Bool =  false
    var body: some View {
        Text(title).font(.callout).frame(minWidth: 35).padding(.vertical,8).padding(.horizontal, 8).themeColor(isSelected:isSelected)
            .cornerRadius(16)
    }
}
extension View {
    func themeColor(isSelected: Bool) -> some View{
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray).foregroundStyle(isSelected ? .spotifyBalcak : .spotifyWhite)
    }
}
#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        HStack{
            SpotifyCategoryCell(title: "All", isSelected: true)
            SpotifyCategoryCell(title: "Music")
            SpotifyCategoryCell(title: "Podcust")
        }
    }
}
