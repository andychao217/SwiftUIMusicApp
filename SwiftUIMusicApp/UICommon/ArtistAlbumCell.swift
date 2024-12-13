//
//  ArtistAlbumCell.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/11.
//

import SwiftUI

struct ArtistAlbumCell: View {
	var sObj : NSDictionary
	
    var body: some View {
		VStack {
			Image(sObj.value(forKey: "image") as? String ?? "")
				.resizable()
				.scaledToFill()
				.frame(width: 90, height: 80)
				.padding(.bottom, 4)
				.clipped()
			
			Text(sObj.value(forKey: "name") as? String ?? "")
				.font(.customfont(.bold, fontSize: 13))
				.foregroundColor(.primaryText60)
				.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
			
			Text(sObj.value(forKey: "year") as? String ?? "")
				.font(.customfont(.bold, fontSize: 10))
				.foregroundColor(.secondaryText)
				.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
		}
		.frame(width: 90)
    }
}

#Preview {
	ArtistDetailView()
}
