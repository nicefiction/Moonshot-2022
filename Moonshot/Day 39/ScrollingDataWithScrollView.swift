/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data

import SwiftUI


struct CustomText: View {
    
    var text: String
    
    init(text: String) {
        var count: Int = 0
        print("\(count)...Creating \(text)")
        self.text = text
        count += 1
    }
    
    var body: some View {
        return Text(text)
    }
}



struct ScrollingDataWithScrollView: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
//        ScrollView {
//            VStack {
//                ForEach(1..<100) {
//                    Text("\($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }

//        ScrollView {
//            LazyVStack {
//                ForEach(1..<100) {
//                    Text("\($0)")
//                        .font(.title)
//                }
//            }
//        }

//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 40) {
//                ForEach(1..<100) {
//                    Text("\($0)")
//                        .font(.title)
//                }
//            }
//        }
        
//        ScrollView {
        /// WIth a regular `VStack`,
        /// SwiftUI won’t wait until you scroll down to see the numbers,
        /// it will just create them immediately:
//            VStack {
//                ForEach(1..<100) {
//                    CustomText(text: "Creating number \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
        
        ScrollView {
            /// With a`LazyVStack`
            /// SwiftUI won’t create views until they are actually shown,
            /// and so minimize the amount of system resources being used.
            LazyVStack {
                ForEach(1..<100) {
                    CustomText(text: "Creating number \($0)")
                        .font(.title)
                }
            }
            // .frame(maxWidth: .infinity)
            /// Although the code to use regular and lazy stacks is the same,
            /// there is one important layout difference:
            /// lazy stacks always take up as much as room as is available in our layouts,
            /// whereas regular stacks take up only as much space as is needed.
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct ScrollingDataWithScrollView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ScrollingDataWithScrollView()
            .preferredColorScheme(.dark)
    }
}
