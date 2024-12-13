//
//  PlaylistSongCell.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/9.
//

import SwiftUI

struct PlaylistSongCell: View {
    var sObj: NSDictionary

    var body: some View {
		ZStack(alignment: .bottomLeading) {
			Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			
			Rectangle()
				.fill(Color.black.opacity(0.45))
			
			HStack {
				VStack {
					Text(sObj.value(forKey: "name") as? String ?? "")
						.font(.customfont(.bold, fontSize: 14))
						.foregroundColor(.primaryText)
						.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

					Text(sObj.value(forKey: "songs") as? String ?? "")
						.font(.customfont(.bold, fontSize: 10))
						.foregroundColor(.primaryText28)
						.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
				}
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
				
				Button {
					
				} label: {
					Image("play")
						.resizable()
						.scaledToFit()
						.frame(width: 22, height: 22)
				}

			}
			.padding(15)
        }
		.aspectRatio(CGSize(width: 200, height: 140), contentMode: .fit)
    }
}

#Preview {
	PlaylistsView()
}
