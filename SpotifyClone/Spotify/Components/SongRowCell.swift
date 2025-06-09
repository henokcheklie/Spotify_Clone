//
//  SongRowCell.swift
//  SpotifyClone
//
//  Created by APPLE on 05/04/2025.
//

import SwiftUI

struct SongRowCell: View {
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Title"
    var subtitle: String? = "This is Song Subtitle"
    var onCellPressed: (() -> Void)? = nil
    var onElipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing:8){
            ImageLoaderView(urlString: imageName).frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                if let subtitle = subtitle{
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                      
                }
              
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.blue)
            
            Image(systemName:"ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onElipsisPressed?()
                }
        }
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBalcak
        VStack{
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            
        }
    }.ignoresSafeArea()
}
