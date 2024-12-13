//
//  SettingsView.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/11.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var mainVM = MainViewModel.share

    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 15) {
                    Button {
                        mainVM.isShowMenu = true
                    } label: {
                        Image("menu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }

                    Spacer()

                    Text("Settings")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText80)

                    Spacer()
					
					//占位符，使得中间的页面标题能居中
					Button {
					} label: {
					}
					.frame(width: 25, height: 25)
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)

                ScrollView(showsIndicators: false) {
					VStack {
						SettingRow(title: "Display", icon: "s_display")
						SettingRow(title: "Audio", icon: "s_audio")
						SettingRow(title: "Headset", icon: "s_headset")
						SettingRow(title: "Lock Screen", icon: "s_lock_screen")
						SettingRow(title: "Advanced", icon: "s_menu")
						SettingRow(title: "Other", icon: "s_other")
					}
					.padding(20)
                }
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
    SettingsView()
}
