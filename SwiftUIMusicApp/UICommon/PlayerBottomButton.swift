//
//  PlayerBottomButton.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/11.
//

import SwiftUI

struct PlayerBottomButton: View {
	var title: String
	var icon: String
    var body: some View {
		VStack {
			Image(icon)
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 30)
				.foregroundColor(.primaryText)
			
			Text(title)
				.font(.customfont(.regular, fontSize: 14))
				.foregroundColor(.secondaryText)
		}
    }
}

#Preview {
	PlayerBottomButton(title: "Playlist", icon: "playlist")
		.background(Color.bg)
}
