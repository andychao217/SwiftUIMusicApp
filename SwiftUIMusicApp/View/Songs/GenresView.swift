//
//  GenresView.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/9.
//

import SwiftUI

struct GenresView: View {
	@State var allArr: NSArray = [
		[
			"image": "gen_1",
			"name": "Classical",
			"songs": "56 Songs",
		],
		[
			"image": "gen_2",
			"name": "Pop",
			"songs": "80 Songs",
		],
		[
			"image": "gen_3",
			"name": "Hip-Pop",
			"songs": "56 Songs",
		],
		[
			"image": "gen_4",
			"name": "Rock",
			"songs": "120 Songs",
		],
		[
			"image": "gen_5",
			"name": "Soul and R&B",
			"songs": "99 Songs",
		],
		[
			"image": "gen_6",
			"name": "Instrumental",
			"songs": "140 Songs",
		],
		[
			"image": "gen_7",
			"name": "Jazz",
			"songs": "70 Songs",
		],
		[
			"image": "gen_8",
			"name": "Country Music",
			"songs": "80 Songs",
		]
	]
	var columnGrid = [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)]

	var body: some View {
		ScrollView {
			LazyVGrid(columns: columnGrid, spacing: 15) {
				ForEach(0 ..< allArr.count, id: \.self) { index in
					let gObj = allArr[index] as? NSDictionary ?? [:]
					GenreCell(gObj: gObj)
				}
			}
			.padding(15)
		}
		.background(Color.bg)
		.ignoresSafeArea()
	}
}

#Preview {
    GenresView()
}
