/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data

import Foundation


extension Bundle {
    
    func decode(_ file: String)
    -> Dictionary<String, Astronaut> {
        
        /// OLIVIER:
        /// In the previous project I was saving data to UserDefaults:
        /*
         init() {
             
             if let _savedData = UserDefaults.standard.data(forKey: "Items") {
         
         
                 let jsonDecoder = JSONDecoder.init()
                 if let _decodedData = try? jsonDecoder.decode(Array<ExpenseItem>.self,
                                                               from: _savedData) {
                     self.items = _decodedData
                     return
                 }
             }
             self.items = items
         }
         */
        /// OLIVIER:
        /// In this project
        /// I am reading data from a file:
        guard
            let _urlToFile = self.url(forResource: file,
                                      withExtension: nil)
        else {fatalError("Failed to locate \(file) in bundle.")}
        
        /// NOTE:
        /// Previously we used` String(contentsOf:)` to load files into a string,
        /// but because `Codable` uses `Data`
        /// we are instead going to use `Data(contentsOf:)`.
        guard
            let _dataFromFile = try? Data(contentsOf: _urlToFile)
        else {fatalError("Failed to load \(file) from bundle.")}
        
        
        let jsonDecoder = JSONDecoder.init()
        
        guard
            let _decodedData = try? jsonDecoder.decode(Dictionary<String, Astronaut>.self,
                                                       from: _dataFromFile)
        else {fatalError("Failed to decode \(file) from bundle.")}
        
        
        return _decodedData
    }
}






/*
 @Published var items = Array<ExpenseItem>() {
     didSet {
         let jsonEncoder = JSONEncoder.init()
         
         if let _encodedData = try? jsonEncoder.encode(items) {
             UserDefaults.standard.set(_encodedData, forKey: "Items")
         }
     }
 }
 
 
 init() {
     
     if let _savedData = UserDefaults.standard.data(forKey: "Items") {
         let jsonDecoder = JSONDecoder.init()
         if let _decodedData = try? jsonDecoder.decode(Array<ExpenseItem>.self,
                                                       from: _savedData) {
             self.items = _decodedData
             return
         }
     }
     self.items = items
 }
 */
