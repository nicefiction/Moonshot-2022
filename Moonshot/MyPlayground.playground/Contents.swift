import Foundation


struct Human {
    
    var firstName: String
    var lastName: String
    var region: String
}


var names: Dictionary<String, Human> = [
    "A": Human.init(firstName: "Dorothy", lastName: "Gale", region: "Emerald City"),
    "B": Human.init(firstName: "Glinda", lastName: "of OZ", region: "Oz"),
    "C": Human.init(firstName: "Ozma", lastName: "of Oz", region: "Oz")
]


let compactNames = names.compactMap { $0 }



