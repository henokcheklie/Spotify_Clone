//
//  PlaylistDescriptionCell.swift
//  SpotifyClone
//
//  Created by APPLE on 02/03/2025.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    var userName:String = "You"
    var descriptionText:String = "This is a sample description"
    var subheadline:String = "Sample Playlist"
    var onAddToPlaylistPressed:(()-> Void)? = nil
    var onDownloadPressed:(()-> Void)? = nil
    var onSharePressed:(()-> Void)? = nil
    var onMorePressed:(()-> Void)? = nil
    var onShelfPressed:(()-> Void)? = nil
    var onPlayPressed:(()-> Void)? = nil
    
    
    var body: some View {
        VStack( alignment: .leading, spacing: 8){
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
           MadeForYouSection
            Text(subheadline)
          IconButtonList
        }.font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
private var MadeForYouSection: some View {
        HStack(spacing: 8){
            
            Image(systemName: "apple.logo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("Made for ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
            
        }
    }
private var IconButtonList: some View {
    HStack(spacing: 0){
        HStack(spacing: 0){
            Image(systemName: "plus.circle")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                
                }
            Image(systemName: "arrow.down.circle")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                
                }
            Image(systemName: "square.and.arrow.up")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                
                }
            Image(systemName: "ellipsis")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                
                }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity,alignment: .leading)
        
        HStack(spacing: 8){
            Image(systemName: "shuffle")
                .font(.system(size: 24))
                .onTapGesture {
                
                }
            Image(systemName: "play.circle.fill")
                .font(.system(size: 46))
                .onTapGesture {
                
                }
        }    .foregroundStyle(.spotifyGreen)
        }.font(.title2)
  
    }
}
#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        PlaylistDescriptionCell().padding()
    }
}
