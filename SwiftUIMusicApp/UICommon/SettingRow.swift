//
//  SettingRow.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/11.
//

import SwiftUI

struct SettingRow: View {
	
	var title: String
	var icon: String
	
    var body: some View {
		VStack {
			HStack(spacing: 15) {
				Image(icon)
					.resizable()
					.scaledToFit()
					.frame(width: 25, height: 25)
				
				Text(title)
					.font(.customfont(.medium, fontSize: 14))
					.foregroundColor(.primaryText.opacity(0.9))
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			
			Divider()
				.padding(.leading, 40)
		}
		.frame(height: 44)
    }
}

#Preview {
	SettingRow(title: "Title", icon: "s_display")
		.padding(20)
		.background(Color.bg)
}
