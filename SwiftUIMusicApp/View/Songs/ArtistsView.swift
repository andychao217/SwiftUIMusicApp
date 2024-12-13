//
//  ArtistsView.swift
//  SwiftUIMusicApp
//
//  Created by Andy Chao on 2024/12/9.
//

import SwiftUI

struct ArtistsView: View {
    @State var allArr: NSArray = [
        [
            "image": "ar_1",
            "name": "Beyonce",
            "albums": "4 Albums",
            "songs": "38 Songs",
        ],
		[
			"image": "ar_2",
			"name": "Bebe Rexha",
			"albums": "2 Albums",
			"songs": "18 Songs",
		],
		[
			"image": "ar_3",
			"name": "Maroon 5",
			"albums": "5 Albums",
			"songs": "46 Songs",
		],
		[
			"image": "ar_4",
			"name": "Michael Jackson",
			"albums": "10 Albums",
			"songs": "112 Songs",
		],
		[
			"image": "ar_5",
			"name": "Queens",
			"albums": "3 Albums",
			"songs": "32 Songs",
		],
		[
			"image": "ar_6",
			"name": "Yani",
			"albums": "1 Albums",
			"songs": "13 Songs",
		],
    ]

    var body: some View {
		ScrollView {
			LazyVStack(spacing: 15) {
				ForEach(0..<allArr.count, id: \.self) { index in
					let aObj = allArr[index] as? NSDictionary ?? [:]
					NavigationLink {
						ArtistDetailView()
					} label: {
						ArtistCell(aObj: aObj)
					}
				}
			}
			.padding(20)
		}
		.ignoresSafeArea()
		.background(Color.bg)
    }
}

#Preview {
	NavigationView {
		ArtistsView()
	}
}
