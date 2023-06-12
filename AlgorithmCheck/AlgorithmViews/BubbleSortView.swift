//
//  BubbleSortView.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 10/06/2023.
//

import SwiftUI

struct BubbleSortView: View {
	@State private var first = 1
	@State private var last = 10
	@ObservedObject var bridge = BubbleSortController()
	
	private let columns = [GridItem(.adaptive(minimum: 30))]
	
	var body: some View {
		NavigationView {
			VStack {
				chooseRange
				VStack(alignment: .trailing) {
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
								ForEach(Array(bridge.arr.enumerated()), id: \.element) { (item, i) in
									Text("\(i)")
										.frame(width: 30)
										.background(i == bridge.checkedNumber ? bridge.currentNumber < bridge.checkedNumber ? .green : .red : i == bridge.currentNumber ? .gray : .white)
										.border(.black)
										.scaleEffect(i == bridge.checkedNumber ? bridge.currentNumber < bridge.checkedNumber ? 1.3 : 1.3 : i == bridge.currentNumber ? 1.3 : 1)
										.animation(.easeIn(duration: bridge.sec), value: bridge.arr)
										
								}
								.padding(.horizontal, 50)
								
							}
							.padding()
					}
				}
				Button{
					withAnimation{ () -> () in
						Task {
							try! await bridge.sort()
						}
					}
				} label: {
					Text("Start")
						.bold()
				}
				.buttonStyle(DefaultButton())
				Spacer()
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

struct BubbleSortView_Previews: PreviewProvider {
	static var previews: some View {
		BubbleSortView()
	}
}

