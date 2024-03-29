//
//  Character.swift
//  RickAndMorty
//
//  Created by Diplomado on 02/12/23.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let species: String
}
