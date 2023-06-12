//
//  QuickSortView.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 12/06/2023.
//

import SwiftUI

struct QuickSortView: View {
	@State private var first = 0
	@State private var last = 19
	
	@ObservedObject var bridge = QuickSortController()
	
	private let columns = [GridItem(.adaptive(minimum: 30))]
	
	var body: some View {
		NavigationView {
			VStack {
				chooseRange
				HStack {
					chooseDelay
					Button {
						bridge.shuffle()
					} label: {
						Text("shuffle")
					}
					.buttonStyle(DefaultButton())
				}
				HStack{
					LazyVGrid(columns: columns, spacing: 20) {
						ForEach(Array(bridge.val.enumerated()), id: \.element) { (item, i) in
							Text("\(i)")
								.frame(width: 30)
								.background(i == bridge.lo ? bridge.hi < bridge.lo ? .green : .red : i == bridge.hi ? .gray : .white)
								.border(.black)
								.scaleEffect(i == bridge.lo ? bridge.hi < bridge.lo ? 1.3 : 1.3 : i == bridge.hi ? 1.3 : 1)
								.animation(.easeIn(duration: bridge.sec), value: bridge.val)
							
						}
						.padding(.horizontal, 50)
						
					}
					.padding()
				}
				Button {
					bridge.sort(bridge.start, bridge.end)
				} label: {
					Text("start")
				}
			}
		}
    }
	
	var chooseRange: some View {
		HStack(spacing: 0) {
			Spacer()
			HStack {
				Text("Range 1 to")
					.bold()
					.padding(.trailing, -10)
				Picker("1 to ", selection: $last) {
					ForEach(2...50, id: \.self) { i in
						Text("\(i)")
					}
				}
				.pickerStyle(.wheel)
				.frame(height: 100)
			}
			Button {
				bridge.createArr(first, last)
			} label: {
				Text("create")
			}
			.buttonStyle(DefaultButton())
		}
	}
	
	var chooseDelay: some View {
		HStack {
			Text("Delay")
				.bold()
			Button {
				bridge.delayMinus()
			} label: {
				Text(" - ")
			}
			.buttonStyle(SimpleButton())
			Text("\(String(format: "%.1f", bridge.sec))")
			Button {
				bridge.delayPlus()
			} label: {
				Text(" + ")
			}
			.buttonStyle(SimpleButton())
		}
	}
	
}

struct QuickSortView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSortView()
    }
}
