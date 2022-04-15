/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data

import Foundation


extension Bundle {
    
    // func decode(_ file: String)
    //   -> Dictionary<String, Astronaut> {
    func decode<T: Codable>(_ file: String)
    -> T {
        /// Be very careful:
        /// There is a big difference between `T` and `[T]`.
        /// Remember, `T` is a placeholder for whatever type we ask for,
        /// so if we say “decode our dictionary of astronauts,”
        /// then` T` becomes `[String: Astronaut]`.
        /// If we attempt to return `[T]` from `decode()`
        /// then we would actually be returning `[[String: Astronaut]]`
        /// — an array of dictionaries of astronauts!
        guard
            let _urlToFile = self.url(forResource: file,
                                      withExtension: nil)
        else { fatalError("Failed to locate \(file) in bundle.") }
        
        /// NOTE:
        /// Previously we used` String(contentsOf:)` to load files into a string,
        /// but because `Codable` uses `Data`
        /// we are instead going to use `Data(contentsOf:)`.
        guard
            let _loadedData = try? Data(contentsOf: _urlToFile)
        else { fatalError("Failed to load \(file) from bundle.") }
        
        
        let jsonDecoder = JSONDecoder.init()
        
        guard
            // let _decodedData = try? jsonDecoder.decode(Dictionary<String, Astronaut>.self,from: _loadedData)
            let _decodedData = try? jsonDecoder.decode(T.self,from: _loadedData)
        else { fatalError("Failed to decode \(file) from bundle.") }
        
        
        return _decodedData
    }
}
/// WITHOUT GENERICS:
/*
func decode(_ file: String)
-> Dictionary<String, Astronaut> {
    
    guard
        let _urlToFile = self.url(forResource: file,
                                  withExtension: nil)
    else { fatalError("Failed to locate \(file) in bundle.") }
 
    guard
        let _loadedData = try? Data(contentsOf: _urlToFile)
    else { fatalError("Failed to load \(file) from bundle.") }
    
    
    let jsonDecoder = JSONDecoder.init()
    
    guard
        let _decodedData = try? jsonDecoder.decode(Dictionary<String, Astronaut>.self,from: _loadedData)
    else { fatalError("Failed to decode \(file) from bundle.") }
    
    
    return _decodedData
}
*/




/// DICTIONARY:
// Dictionary<String, Astronaut>
// let astronautGrissom = Astronaut.init(id: "grissom",
//                                       name: "Virgil I. \"Gus\" Grissom"),
//                                       description: ""Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was..."
// "grissom": astronautGrissom,
//
/*
 {
     "grissom": {
         "id": "grissom",
         "name": "Virgil I. \"Gus\" Grissom",
         "description": "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor."
     },
 */
/// ARRAY:
/*
 [
     {
         "id": 1,
         "crew": [
             {
                 "name": "grissom",
                 "role": "Command Pilot"
             },
             {
                 "name": "white",
                 "role": "Senior Pilot"
             },
             {
                 "name": "chaffee",
                 "role": "Pilot"
             }
         ],
         "description": "Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program, the project to land the first men on the Moon.\n\nPlanned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew members—Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffee—and destroyed the command module (CM).\n\nThe name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire."
     },
 */





/// `SAVING DATA USING USERDEFAULTS`:
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
