//
//  SongsView.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/9.
//

import SwiftUI

struct SongsView: View {
    @StateObject var mainVM = MainViewModel.share

    var body: some View {
        ZStack {
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
                            .frame(width: 25, height: 25)
                    }

                    Spacer()

                    Text("Songs")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)

                    Spacer()

                    Button {
                    } label: {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primaryText28)
                    }
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)

                ScrollViewReader { scrollView in
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack(alignment: .bottomLeading) {
                            HStack(spacing: 15) {
								ScrollTabButton(title: "All Songs", isSelect: mainVM.selectSongTab == 0) {
                                    withAnimation {
                                        scrollView.scrollTo(0, anchor: .center)
										mainVM.selectSongTab = 0
                                    }
                                }
                                .id(0)

								ScrollTabButton(title: "Playlists", isSelect: mainVM.selectSongTab == 1) {
                                    withAnimation {
                                        scrollView.scrollTo(1, anchor: .center)
										mainVM.selectSongTab = 1
                                    }
                                }
                                .id(1)

								ScrollTabButton(title: "Albums", isSelect: mainVM.selectSongTab == 2) {
                                    withAnimation {
                                        scrollView.scrollTo(2, anchor: .center)
										mainVM.selectSongTab = 2
                                    }
                                }
                                .id(2)

								ScrollTabButton(title: "Artists", isSelect: mainVM.selectSongTab == 3) {
                                    withAnimation {
                                        scrollView.scrollTo(2, anchor: .center)
										mainVM.selectSongTab = 3
                                    }
                                }
                                .id(3)

								ScrollTabButton(title: "Genres", isSelect: mainVM.selectSongTab == 4) {
                                    withAnimation {
                                        scrollView.scrollTo(4, anchor: .center)
										mainVM.selectSongTab = 4
                                    }
                                }
                                .id(4)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)

                            Rectangle()
                                .fill(Color.focusStart)
                                .frame(width: 70, height: 2, alignment: .leading)
								.padding(.leading, CGFloat(mainVM.selectSongTab) * (70 + 15) + 20)
                        }
                    }
					.onChange(of: mainVM.selectSongTab) { _, _ in
                        withAnimation {
							scrollView.scrollTo(mainVM.selectSongTab, anchor: .center)
                        }
                    }
                }
                .frame(height: 25)
                .background(Color.bg)

				TabView(selection: $mainVM.selectSongTab) {
					AllSongsView().tag(0)

					PlaylistsView().tag(1)

					AlbumsView().tag(2)

					ArtistsView().tag(3)

					GenresView().tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
				.padding(.bottom, .bottomInsets + 40)
            }
        }
        .onAppear(perform: {
            UITabBar.appearance().isHidden = true
        })
        .frame(width: .screenWidth, height: .screenHeight)
        .background(Color.bg)
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SongsView()
}
