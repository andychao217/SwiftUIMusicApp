//
//  IconTextRow.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/6.
//

import SwiftUI

struct IconTextRow: View {
	var title: String
	var icon: String
	
    var body: some View {
		HStack {
			Image(icon)
				.resizable()
				.scaledToFit()
				.frame(width: 25, height: 25)
			
			Text(title)
				.font(.customfont(.medium, fontSize: 12))
				.foregroundColor(.primaryText.opacity(0.9))
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
		}
		.frame(height: 40)
		
		Divider()
			.padding(.leading, 40)
    }
}

#Preview {
	IconTextRow(title: "Title", icon: "m_theme")
}
