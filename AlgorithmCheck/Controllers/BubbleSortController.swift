//
//  BubbleSortController.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 10/06/2023.
//

import Foundation
import SwiftUI

@MainActor class BubbleSortController: ObservableObject{
	@Published var arr: [Int] = [1,2,3,14,5,16,7,18,20,10,19,12,13,4,15,6,17,8,11,9]
	@Published var currentNumber = 0
	@Published var checkedNumber = 0
	@Published var sec = 0.1
	
	func sort() async throws {
		var notSorted = true
		
		while notSorted {
			notSorted = false
			for i in 1...arr.count - 1 {
				withAnimation { () -> () in
					currentNumber = arr[i - 1]
					checkedNumber = arr[i]
				}
				if arr[i] < arr[i - 1] {
					try await Task.sleep(nanoseconds: UInt64(sec * 999999999))
					(arr[i], arr[i - 1]) = (arr[i - 1], arr[i])
					notSorted = true
				} else {
					try await Task.sleep(nanoseconds: UInt64(sec * 999999999))
				}
			}
		}
	}
	
	func createArr(_ first: Int, _ last: Int) {
		arr = Array(first...last)
	}
	
	func shuffle() {
		arr.shuffle()
	}
	
	func delayPlus() {
		sec += 0.1
		print(sec)
	}
	
	func delayMinus() {
		if sec > 0.1 {
			sec -= 0.1
		}
	}
	
	
	
}

