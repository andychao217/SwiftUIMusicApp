//
//  GenreCell.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/10.
//

import SwiftUI

struct GenreCell: View {
	var gObj: NSDictionary
	
    var body: some View {
		ZStack(alignment: .center) {
			Image(gObj.value(forKey: "image") as? String ?? "")
				.resizable()
				.scaledToFill()
			
			Rectangle()
				.fill(Color.black.opacity(0.87))
			
			VStack {
				Text(gObj.value(forKey: "name") as? String ?? "")
					.font(.customfont(.bold, fontSize: 15))
					.foregroundColor(.primaryText)
				
				Text(gObj.value(forKey: "songs") as? String ?? "")
					.font(.customfont(.regular, fontSize: 10))
					.foregroundColor(.primaryText80)
			}
			.padding(8)
		}
		.frame(width: (.screenWidth - 55) / 2, height: (.screenWidth - 55) / 2 * 0.75)
    }
}

#Preview {
	GenresView()
}
