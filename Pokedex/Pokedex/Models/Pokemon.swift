//
//  Pokemon.swift
//  Pokedex
//
//  Created by Hector Steven on 5/10/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

class Pokemon: Codable, Equatable {
	static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
		return lhs.id == rhs.id
	}

	let name: String
	let id: Int
}
