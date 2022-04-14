/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/resizing-images-to-fit-the-screen-using-geometryreader

import SwiftUI



struct ResizingImagesUsingGeometryReader: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Image("cherryblossom-unsplash")
            .resizable()
            .scaledToFit()
        
        Image("cherryblossom-unsplash")
            .frame(width:  300, height: 300)
        
        Image("cherryblossom-unsplash")
            .frame(width:  300, height: 300)
            .clipped()
        
        Image("cherryblossom-unsplash")
            .resizable()
            .scaledToFill()
            .frame(width:  300, height: 300)
        
        Image("cherryblossom-unsplash")
            .resizable()
            .scaledToFit()
            .frame(width:  300, height: 300)
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            Image("cherryblossom-unsplash")
                .resizable()
                .scaledToFit()
                .frame(width: geometryProxy.size.width * 0.8)
            /// `TIP`:
            /// If you ever want to center a view inside a `GeometryReader`,
            /// rather than aligning to the top-left corner,
            /// add a second frame that makes it fill the full space of the container,
            /// like this:
                .frame(width: geometryProxy.size.width,
                       height: geometryProxy.size.height)
        }
        
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct ResizingImagesUsingGeometryReader_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ResizingImagesUsingGeometryReader()
    }
}
