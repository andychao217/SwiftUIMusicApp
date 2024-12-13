//
//  ViewAllSection.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/6.
//

import SwiftUI

struct ViewAllSection: View {
	var title: String
	var button: String = "View All"
	var didTap: (()->())?
	
    var body: some View {
		HStack {
			Text(title)
				.font(.customfont(.medium, fontSize: 15))
				.foregroundColor(.primaryText80)
				.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
			
			Button {
				didTap?()
			} label: {
				Text(button)
					.font(.customfont(.regular, fontSize: 11))
					.foregroundColor(.org)
			}
		}
    }
}

#Preview {
	ViewAllSection(title: "Title", button: "View All")
	
}
