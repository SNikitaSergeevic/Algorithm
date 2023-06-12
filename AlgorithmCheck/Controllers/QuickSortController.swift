//
//  QuickSortController.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 12/06/2023.
//

import Foundation
import SwiftUI

@MainActor class QuickSortController: ObservableObject {
	@Published var val: [Int] = [1,2,3,14,5,16,7,18,20,10,19,12,13,4,15,6,17,8,11,9]
	@Published var sec = 0.1
	@Published var hi = 0
	@Published var lo = 0
	@Published var divider = 0
	var start = 0
	var end = 19
	
	func sort(_ start: Int, _ end: Int) -> [Int] {
		if start >= end {return val}
		divider = val[start]
		var lo = start
		var hi = end
		hi = val[lo]
		lo = val[hi]
		
		while true {
			while val[hi] >= divider {
				hi = hi - 1
				lo = val[hi]
				if hi <= lo {break}
			}
			if hi <= lo {
				val[lo] = divider
				break
			}
			val[lo] = val[hi]
			lo = lo + 1
			while val[lo] < divider {
				lo = lo + 1
				if lo >= hi {break}
			}
			if lo >= hi {
				lo = hi
				val[hi] = divider
				break
			}
			val[hi] = val[lo]
		}
		
		val = sort(start, lo - 1)
		val = sort(lo + 1, end)
		return val
	}
	
	func createArr(_ first: Int, _ last: Int) {
		val = Array(first...last)
	}
	
	func shuffle() {
		val.shuffle()
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
