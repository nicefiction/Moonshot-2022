/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/how-to-lay-out-views-in-a-scrolling-grid

import SwiftUI



struct ScrollingGrids: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    /// STEP 1:
    let fixedColumnLayout: Array<GridItem> = [
        
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    /// STEP 1:
    let adaptiveGridLayout = [
        GridItem(.adaptive(minimum: 80,
                           maximum: 120))
    ]
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        /// STEP 2:
//        LazyVGrid(columns: fixedColumnLayout) {
//            ForEach(0..<1_000) {
//                Text("Item \($0)")
//            }
//        }
        /// STEP 2:
//        LazyVGrid(columns: adaptiveGridLayout) {
//            ForEach(0..<1_000) {
//                Text("Item \($0)")
//            }
//        }
        /// STEP 2:
        LazyHGrid(rows: adaptiveGridLayout) {
            ForEach(0..<1_000) {
                Text("Item \($0)")
            }
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct ScrollingGrids_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ScrollingGrids()
    }
}
