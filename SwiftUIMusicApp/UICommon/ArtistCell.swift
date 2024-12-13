//
//  ArtistCell.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/10.
//

import SwiftUI

struct ArtistCell: View {
    var aObj: NSDictionary

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(aObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 1)
                        .stroke(Color.primaryText28, lineWidth: 1)
                })
                .frame(width: 80, height: 80)

            VStack {
				Text(aObj.value(forKey: "name") as? String ?? "")
					.font(.customfont(.bold, fontSize: 15))
					.foregroundColor(.primaryText)
					.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

				Text("\(aObj.value(forKey: "albums") as? String ?? "") • \(aObj.value(forKey: "songs") as? String ?? "")")
					.font(.customfont(.regular, fontSize: 11))
					.foregroundColor(.primaryText80)
					.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
				
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
			
			Menu {
				Button {
				} label: {
					Text("Play")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Play Next")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Add to playlist queue")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Add to playlist")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Rename")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Tag Editor")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Go to artist")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Delete from device")
						.foregroundColor(.primaryText)
				}

				Button {
				} label: {
					Text("Share")
						.foregroundColor(.primaryText)
				}

			} label: {
				Image("more_btn")
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
			}
			.environment(\.colorScheme, .dark)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    ArtistsView()
}
