//
//  TableViewModel.swift
//  gameRockPaperScissors
//
//  Created by Diplomado on 27/10/23.
//

import Foundation


class TableViewModel{
    var rowsArray : [gameState]
    var hansArray : [(hand,hand)]
    
    init() {
        rowsArray = []
        hansArray = []
    }
    
    
    func getCountArray()-> Int{
        rowsArray.count
    }
    
    func getTitle(index:IndexPath)-> String {
        rowsArray[index.row].rawValue
    }
    func getTitleSelec(index:IndexPath)-> String {
        
        "👤\(hansArray[index.row].0.rawValue)-\(hansArray[index.row].1.rawValue)🤖"
    }
    
    func getState(index:IndexPath)-> gameState {
        rowsArray[index.row]
    }
    
    
    
    func getSections() -> Int {
        3
    }
    
    func getSectionTitple() -> String {
        "Pokemon"
    }
    
    
    
    func addRow(resultParty:gameState)  {
        rowsArray.append(resultParty)
    }
    
    func deleRow(index:IndexPath)  {
        
        rowsArray.remove(at: index.row)
    }
    
    func equalArray(tempArray:[gameState])  {
        rowsArray = tempArray
    }
    
    func equalArrayHans(tempArray:[(hand,hand)])  {
        hansArray = tempArray
    }
    
}
