//
//  SortModel.swift
//  AlgorithmCheck
//
//  Created by NikitaSergeevich on 10/06/2023.
//

import Foundation

struct BubbleSortModel {
	var arrSort: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
	var arr: [Int] = [1,2,3,14,5,16,7,18,20,10,19,12,13,4,15,6,17,8,11,9]
	
	func sort(_ values: [Int]) -> [Int] {
		var notSorted = true
		var input = values
		
		while notSorted {
			notSorted = false
			for i in 1...arr.count - 1 {
				if input[i] < input[i - 1] {
					(input[i], input[i - 1]) = (input[i - 1], input[i])
					notSorted = true
				}
			}
		}
		return input
	}
	
}


struct QuickSortModel {
	var arr: [Int] = [1,2,3,14,5,16,7,18,20,10,19,12,13,4,15,6,17,8,11,9]
	
	func sort(_ values: [Int], _ start: Int, _ end: Int) -> [Int] {
		if start >= end {return values}
		var val = values
		var divider = val[start]
		var lo = start
		var hi = end
		
		while true {
			while val[hi] >= divider {
				hi = hi - 1
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
		
		val = sort(val, start, lo - 1)
		val = sort(val, lo + 1, end)
		return val
	}
}
