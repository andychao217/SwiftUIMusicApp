//
//  MainViewModel.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/6.
//

import Foundation

class MainViewModel: ObservableObject {
	static var share:  MainViewModel =  MainViewModel()
	
	@Published var selectTab: Int = 0
	@Published var isShowMenu: Bool = false
	@Published var selectSongTab: Int = 0
}
