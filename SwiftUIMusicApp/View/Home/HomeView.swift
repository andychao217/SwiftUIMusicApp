//
//  HomeView.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/11/28.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject var mainVM = MainViewModel.share
	
	@State var txtSearch: String = ""
	@State var hostRecommendedArr: NSArray = [
		[
			"image": "img_1",
			"name": "Sound of Sky",
			"artists": "Dilon Bruce"
		],
		[
			"image": "img_2",
			"name": "Girl on Fire",
			"artists": "Alecia Keys"
		],
	]
	
	@State var playlistArr: NSArray = [
		[
			"image": "img_3",
			"name": "Classic Playlist",
			"artists": "Piano Guys"
		],
		[
			"image": "img_4",
			"name": "Summer Playlist",
			"artists": "Dilon Bruce"
		],
		[
			"image": "img_5",
			"name": "Pop Music",
			"artists": "Michael Jackson"
		],
	]
	
	var recentlyPlayerArr: NSArray = [
		[
			"rate": 4,
			"name": "Billie Jean",
			"artists": "Michael Jackson"
		],
		[
			"rate": 4,
			"name": "Earth Song",
			"artists": "Michael Jackson"
		],
		[
			"rate": 4,
			"name": "Mirror",
			"artists": "Michael Jackson"
		],
		[
			"rate": 4,
			"name": "Remember the Time",
			"artists": "Michael Jackson"
		],
	]
	
    var body: some View {
		ZStack {
			ScrollView {
				VStack {
					Text("Hot Recommended")
						.font(.customfont(.medium, fontSize: 15))
						.foregroundColor(.primaryText80)
						.padding(.top, .topInsets + 46)
						.padding(.horizontal, 20)
						.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
					
					ScrollView(.horizontal) {
						LazyHStack(spacing: 15) {
							ForEach(0..<hostRecommendedArr.count, id: \.self) { index in
								let sObj = hostRecommendedArr[index] as? NSDictionary ?? [:]
								VStack {
									Image(sObj.value(forKey: "image") as? String ?? "")
										.resizable()
										.scaledToFill()
										.frame(width: 230, height: 125)
										.padding(.bottom, 4)
									
									Text(sObj.value(forKey: "name") as? String ?? "")
										.font(.customfont(.bold, fontSize: 13))
										.foregroundColor(.primaryText60)
										.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
									
									Text(sObj.value(forKey: "artists") as? String ?? "")
										.font(.customfont(.bold, fontSize: 10))
										.foregroundColor(.secondaryText)
										.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
								}
							}
						}
						.padding(.horizontal, 20)
					}
				}
				
				ViewAllSection(title: "Playlists") {
					
				}
				.padding(.horizontal, 20)
				.padding(.vertical, 8)
				
				ScrollView {
					VStack {
						ScrollView(.horizontal) {
							LazyHStack(spacing: 15) {
								ForEach(0..<playlistArr.count, id: \.self) { index in
									let sObj = playlistArr[index] as? NSDictionary ?? [:]
									VStack {
										Image(sObj.value(forKey: "image") as? String ?? "")
											.resizable()
											.scaledToFill()
											.frame(width: 110, height: 110)
											.padding(.bottom, 4)
										
										Text(sObj.value(forKey: "name") as? String ?? "")
											.font(.customfont(.bold, fontSize: 13))
											.foregroundColor(.primaryText60)
											.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
										
										Text(sObj.value(forKey: "artists") as? String ?? "")
											.font(.customfont(.bold, fontSize: 10))
											.foregroundColor(.secondaryText)
											.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
									}
								}
							}
							.padding(.horizontal, 20)
						}
					}
				}
				
				ViewAllSection(title: "Recently Played") {
					
				}
				.padding(.horizontal, 20)
				.padding(.vertical, 8)
				
				LazyVStack(spacing: 10) {
					ForEach(0..<recentlyPlayerArr.count, id: \.self) { index in
						let sObj = recentlyPlayerArr[index] as? NSDictionary ?? [:]
						
						HStack{
							Button {
								
							} label: {
								Image("play_btn")
									.resizable()
									.scaledToFit()
									.frame(width: 25, height: 25)
							}

							VStack {
								Text(sObj.value(forKey: "name") as? String ?? "")
									.font(.customfont(.bold, fontSize: 13))
									.foregroundColor(.primaryText60)
									.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
								
								Text(sObj.value(forKey: "artists") as? String ?? "")
									.font(.customfont(.bold, fontSize: 10))
									.foregroundColor(.secondaryText)
									.frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
							}
							
							VStack {
								Image("fav")
									.resizable()
									.scaledToFit()
									.frame(width: 12, height: 12)
								
								HStack(spacing: 2) {
									ForEach(1...5, id:\.self) { index in
										Image(systemName: "star.fill")
											.resizable()
											.scaledToFit()
											.frame(width: 12, height: 12)
											.foregroundColor(.org)
									}
								}
							}
						}
						
						Divider()
							.padding(.leading, 60)
					}
				}
				.padding(.horizontal, 20)
				.padding(.vertical, 8)
			}
			
			VStack {
				HStack(spacing: 15) {
					Button {
						withAnimation {
							mainVM.isShowMenu = true
						}
					} label: {
						Image("menu")
							.resizable()
							.scaledToFit()
							.frame(width:25, height: 25)
					}

					HStack {
						Image("search")
							.resizable()
							.scaledToFit()
							.frame(width:20, height: 20)
							.foregroundColor(.primaryText28)
						
						TextField("Search Album Song", text: $txtSearch)
							.frame(minWidth: 0, maxWidth: .infinity)
							.foregroundColor(.primaryText)
					}
					.padding(.horizontal, 15)
					.padding(.vertical, 8)
					.background(Color(hex: "292E4B"))
					.cornerRadius(30)
				}
				.padding(.top, .topInsets)
				.padding(.horizontal, 20)
				
				Spacer()
			}
		}
		.frame(width: .screenWidth, height: .screenHeight)
		.background(Color.bg)
		.navigationTitle("")
		.navigationBarBackButtonHidden()
		.navigationBarHidden(true)
		.ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
