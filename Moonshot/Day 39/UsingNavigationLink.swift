/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink

import SwiftUI



struct UsingNavigationLink: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
//        NavigationView {
//            Text("Hello, world!")
//                .navigationTitle("Option 1")
//        }
        
//        NavigationView {
//            NavigationLink("Hello World",
//                           destination: {
//                Text("Hello Again")
//            })
//            .navigationTitle("Option 2")
//        }
        
//        NavigationView {
//            List {
//                ForEach(1..<99) { (eachNumber: Int) in
//                    NavigationLink("Row \(eachNumber)",
//                                   destination: {
//                        Text("Detail view \(eachNumber)")
//                    })
//                }
//            }
//            .navigationTitle("Option 3")
//        }
        
        NavigationView {
            List {
                ForEach(1..<99) { (eachNumber: Int) in
                    NavigationLink("Row \(eachNumber)") {
                        Text("Detail view \(eachNumber)")
                    }
                }
            }
            .navigationTitle("Option 3")
        }
        
        NavigationView {
            List {
                ForEach(1..<99) { (eachNumber: Int) in
                    NavigationLink {
                        Text("Row \(eachNumber)")
                    } label: {
                        Text("Detail view \(eachNumber)")
                    }
                }
            }
            .navigationTitle("Option 3")
        }
        
        NavigationView {
            List {
                ForEach(1..<10) { (eachNumber: Int) in
                    NavigationLink(destination: {
                        Text("Destination \(eachNumber)")
                    }, label: {
                        Text("Label \(eachNumber)")
                    })
                }
            }
            .navigationTitle("Option 4")
        }
        
        NavigationView {
            List(1..<10) { (eachNumber: Int) in
                NavigationLink {
                    Text("Destination \(eachNumber)")
                } label: {
                    Text("Label \(eachNumber)")
                }
            }
            .navigationTitle("Option 4")
        }
    }
    
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct UsingNavigationLink_Previews: PreviewProvider {
    
    static var previews: some View {
        
        UsingNavigationLink()
    }
}
