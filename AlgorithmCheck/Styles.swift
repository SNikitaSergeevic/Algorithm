//
//  Styles.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 10/06/2023.
//

import SwiftUI

struct CheckStyles: View {
	var body: some View {
		VStack {
			Button{ } label: {
				Text("DefaultButton")
			}
			.buttonStyle(DefaultButton())
			Text("fixed size")
				.padding(.top, -20)
			
			Button{ } label: {
				Text("+")
			}
			.buttonStyle(SimpleButton())
			Text("SimpleButton")
				.padding(.top, -20)
		}
	}
}

struct CheckStyles_Previews: PreviewProvider {
	static var previews: some View {
		CheckStyles()
	}
}

// TODO: Styles

struct DefaultButton: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		let label = configuration.label
			ZStack {
				RoundedRectangle(cornerRadius: 20)
					.opacity(0.7)
					.blur(radius: 0.9)
				label
					.foregroundColor(.white)
			}
			.frame(maxWidth: 100, maxHeight: 40)
			.padding()
			.scaleEffect(configuration.isPressed ? 1.1 : 1)
			.animation(.easeIn(duration: 0.2), value: configuration.isPressed)
		
	}
}

struct SimpleButton: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		let label = configuration.label
			ZStack {
				RoundedRectangle(cornerRadius: 20)
				label.foregroundColor(.white)
			}
			.frame(maxWidth: 30, maxHeight: 30)
			.padding()
			.scaleEffect(configuration.isPressed ? 1.1 : 1)
			.animation(.easeIn(duration: 0.2), value: configuration.isPressed)
	}
}


