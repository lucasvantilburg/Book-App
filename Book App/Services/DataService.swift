//
//  DataService.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import Foundation

class DataService {
    
    //parse local json file
    static func getLocalData() -> [Book] {
        
        let pathString = Bundle.main.path(forResource: "Data", ofType: "JSON")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                let bookData = try decoder.decode([Book].self, from: data)
                
                return bookData
                
            }
            catch {
                print(error)
            }
        
        }
        catch {
            print(error)
        }
        
        
        return [Book]()
    }
}
