//
//  MainView.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 10/06/2023.
//

import SwiftUI

struct MainView: View {
	
	var body: some View {
		NavigationView {
			List {
				Section(header: Text("Sorts")) {
					HStack {
						NavigationLink(Algorithm.bubbleSort.rawValue, destination: BubbleSortView())
							.foregroundColor(.black)
						Spacer()
					}
				}
			}
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
