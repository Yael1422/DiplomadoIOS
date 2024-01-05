//
//  model.swift
//  shoppingList
//
//  Created by Diplomado on 28/10/23.
//

import Foundation


class Model{
    var rowsArray : [String]
    
    init() {
        rowsArray = ["Desodorante","Shampoo","Comida para perros", "Comida para gatos", "Yogurt"]
    }
    
    func getCountArray()-> Int{
        rowsArray.count
    }
    
    func getTitle(index:IndexPath)-> String {
        rowsArray[index.row]
    }
    
    func getSectionTitple() -> String {
        "Mi lista"
    }
    
    func addRow(text:String)  {
        rowsArray.append(text)
    }
    
    func deleRow(index:IndexPath)  {
        
        rowsArray.remove(at: index.row)
    }
    
}
