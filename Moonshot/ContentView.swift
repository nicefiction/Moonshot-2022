/// SOURCE:

import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let fixedColumnLayout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        LazyVGrid(columns: fixedColumnLayout) {
            ForEach(0..<1_000) {
                Text("Item \($0)")
            }
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
