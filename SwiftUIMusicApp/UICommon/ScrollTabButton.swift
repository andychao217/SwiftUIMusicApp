//
//  ScrollTabButton.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/9.
//

import SwiftUI

struct ScrollTabButton: View {
	
	var title: String
	var width: Double = 70
	var isSelect: Bool
	var didTap: (()->())?
	
    var body: some View {
		Button {
			didTap?()
		} label: {
			Text(title)
				.font(.customfont(.medium, fontSize: 15))
				.foregroundColor(isSelect ? .focus : .primaryText28)
		}
		.frame(width: width)
    }
}

#Preview {
	ScrollTabButton(title: "Title", isSelect: true)
}
