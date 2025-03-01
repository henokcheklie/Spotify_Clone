//
//  PlaylistHeadrCell.swift
//  SpotifyClone
//
//  Created by APPLE on 01/03/2025.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    var height:CGFloat = 300
    var title:String = "Playlist Title"
    var subtitle: String = "Subtitle-Playlist"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = Color.spotifyBlack.opacity(0.8)
    
    var body: some View {
        ZStack{
            Rectangle()
                .opacity(0)
                .overlay(
                    ImageLoaderView(urlString: imageName)
                )
                .overlay(
                    VStack(alignment: HorizontalAlignment.leading, spacing:8){
                        Text(subtitle)
                            .font(.headline)
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }.foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom
                        )
                    )
                    ,alignment:.bottomLeading
                )
        }
        .asStretchyHeader(startingHeight: height)
    }
}


#Preview {
    ZStack {
        Color.spotifyBalcak.ignoresSafeArea()
        ScrollView{
            PlaylistHeaderCell()
        }.ignoresSafeArea()
    }
    
}
