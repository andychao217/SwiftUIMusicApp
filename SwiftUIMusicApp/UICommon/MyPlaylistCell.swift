//
//  MyPlaylistCell.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/9.
//

import SwiftUI

struct MyPlaylistCell: View {
	var sObj: NSDictionary
	
    var body: some View {
		VStack {
			Image(sObj.value(forKey: "image") as? String ?? "")
				.resizable()
				.scaledToFill()
				.frame(width: 90, height: 80)
				.overlay(
					RoundedRectangle(cornerRadius: 5)
						.stroke(Color.primaryText28, lineWidth: 1)
				)
				.padding(.bottom, 4)

			Text(sObj.value(forKey: "name") as? String ?? "")
				.font(.customfont(.bold, fontSize: 13))
				.lineLimit(1)
				.foregroundColor(.primaryText60)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
		}
		.frame(width: 90)
    }
}

#Preview {
	PlaylistsView()
}
