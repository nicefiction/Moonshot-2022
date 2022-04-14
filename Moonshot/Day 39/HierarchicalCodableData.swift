/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/working-with-hierarchical-codable-data

import SwiftUI


struct User: Codable {
    
    let name: String
    let address: Address
}


struct Address: Codable {
    
    let city: String
    let region: String
}


struct HierarchicalCodableData: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        /*
         Button("Decode JSON") {
             let input = """
             {
                 "name": "Taylor Swift",
                 "address": {
                     "street": "555, Taylor Swift Avenue",
                     "city": "Nashville"
                 }
             }
             """

             // more code to come
         }
         */
        Button("Print City",
               action: {
            let input = """
            {
            "name": "Dorothy Gale",
            "address": {
                    "city": "Emerald",
                    "region": "Oz"
                }
            }
            """
            
            let data = Data(input.utf8)
            let jsonDecoder = JSONDecoder.init()
            
            if let _user = try? jsonDecoder.decode(User.self,
                                                   from: data) {
                print("\(_user.name)\n\(_user.address.city)")
            }
        })
    }
     
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// MARK: - PREVIEWS
struct HierarchicalCodableData_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HierarchicalCodableData()
    }
}
