/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/loading-a-specific-kind-of-codable-data

import Foundation



struct Astronaut: Codable,
                  Identifiable {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let id: String
    let name: String
    let description: String
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





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
