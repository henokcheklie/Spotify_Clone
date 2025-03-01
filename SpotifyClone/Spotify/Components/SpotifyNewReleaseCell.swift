//
//  SpotifyNewReleaseSection.swift
//  SpotifyClone
//
//  Created by Henok_Cheklie on 26/02/2025.
//

import SwiftUI

struct SpotifyNewReleaseSection: View {
    var imageName:String = Constants.randomImage
    var headline:String? = "New Release Section"
    var subheadline:String? = "Some Artist"
    var tiltle:String? = "some Playlist"
    var subtitle:String? = "Single - Title"
    var onAddButtonPressed:  (() -> Void)? = nil
    var onPlayButtonPressed:  (() -> Void)? = nil
    
    var body: some View {
        VStack{
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName).frame(width: 50, height: 50).clipShape(.circle)
                VStack(alignment: .leading, spacing: 2){
                    if let headline{
                        Text(headline).foregroundStyle(.spotifyLightGray).font(.callout)
                    }
                    if let subheadline{
                        Text(subheadline).foregroundStyle(.spotifyWhite).fontWeight(.medium)
                            .font(.title2)
                    }
                }
            }.frame( maxWidth: .infinity, alignment: .leading)
            
            ///
            HStack( spacing: 8){
                ImageLoaderView(urlString: imageName).frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 32){
                    VStack(alignment: .leading, spacing: 2){
                        if let tiltle{
                            Text(tiltle).fontWeight(.semibold).foregroundStyle(.spotifyWhite).lineLimit(3)
                        }
                        if let subtitle{
                            Text(subtitle).foregroundStyle(.spotifyLightGray).fontWeight(.medium).lineLimit(3)
                              
                        }
                    }.font(.callout)
                    HStack(spacing:0){
                        Image(systemName:"plus.circle").foregroundStyle(.spotifyLightGray).fontWeight(.medium)
                            .font(.title3)
                            .padding(4)
                            .onTapGesture {
                                onAddButtonPressed?()
                            }
                            .offset(x:-4)
                            .frame( maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName:"play.circle.fill").foregroundStyle(.spotifyWhite).fontWeight(.medium)
                            .font(.title)
                    }
                }.padding(.trailing, 16)
            }.themeColor(isSelected: false)
                .cornerRadius(8)
                .onTapGesture {
                    onPlayButtonPressed?()
                }
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseSection().padding(8)
    }
}
