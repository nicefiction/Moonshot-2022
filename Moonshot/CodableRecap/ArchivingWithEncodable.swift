/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/archiving-swift-objects-with-codable
/// For custom objects:

import SwiftUI


struct Human: Codable {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let firstName: String
    let lastName: String
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






struct ArchivingWithEncodable: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var human = Human.init(firstName: "Dorothy",
                                          lastName: "Gale")
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Button("Save Human", action: {
            let jsonEncoder = JSONEncoder.init()
            if let _encodedData = try? jsonEncoder.encode(human) {
                UserDefaults.standard.set(_encodedData,
                                          forKey: "Human")
                
                print("Saving \(human.firstName) \(human.lastName)")
            }
        })
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct ArchivingWithCodable_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ArchivingWithEncodable()
    }
}
