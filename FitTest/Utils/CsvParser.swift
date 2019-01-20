//
//  CsvParser.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import Foundation

class CsvParser {
    static let shared = CsvParser()
    
    init() {}
    
    // MARK: - Variables
    private let fileName = "test_data"
    private let fileType = "csv"
    
    // MARK: - Functions
    func csvContents() -> [[String]] {
        guard let csvString = self.readContentsFromFile() else { return [] }
        return self.formattedContents(from: csvString)
    }
    
    // MARK: - Private
    private func readContentsFromFile() -> String? {
        // Retreive contents from a csv file at given path
        guard let path = Bundle.main.path(forResource: self.fileName, ofType: self.fileType) else {
            print("No path for test csv file!")
            return nil
        }
        
        do {
            let csvContents = try String(contentsOfFile: path)
            return csvContents
        } catch let error {
            print("Error during csv parsing. Descritpion - \(error.localizedDescription)")
            return nil
        }
    }
    
    private func formattedContents(from csvString: String) -> [[String]] {
        var csvComponents = csvString.replacingOccurrences(of: "\n", with: "").components(separatedBy: "\r")
        guard csvComponents.count > 0 else {
            print("Empty csv componnets!")
            return []
        }
        /* Csv components will always have empty last item,
         so it should be removed for convenience */
        csvComponents.remove(at: csvComponents.count - 1)
        /* Also the first item is just names of columns,
         thus should be removed as well*/
        csvComponents.remove(at: 0)
        
        // Separate valid data and pass it down
        var csvRows: [[String]] = []
        for component in csvComponents {
            csvRows.append(component.components(separatedBy: ","))
        }
        
        return csvRows
    }
}
