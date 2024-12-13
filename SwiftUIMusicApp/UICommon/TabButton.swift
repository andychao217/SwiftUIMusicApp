//
//  TabButton.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/11/28.
//

import SwiftUI

struct TabButton: View {
	@State var title: String
	@State var icon: String
	@State var iconUnfocus: String
	
	var isSelect: Bool
	var didTap: (()->())?
	
    var body: some View {
		Button {
			didTap?()
		} label: {
			VStack {
				Image(isSelect ? icon : iconUnfocus)
					.resizable()
					.scaledToFit()
					.frame(width:20, height: 20)
				
				Text(title)
					.font(.customfont(.regular, fontSize: 12))
					.foregroundColor(isSelect ? .focus : .unfocused)
			}
		}
    }
}

#Preview {
	TabButton(title: "Home", icon: "home_tab", iconUnfocus: "home_tab_un", isSelect: false)
}
