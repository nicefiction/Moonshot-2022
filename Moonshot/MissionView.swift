/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/showing-mission-details-with-scrollview-and-geometryreader

import SwiftUI



struct MissionView: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let mission: Mission
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometryProxy.size.width * 0.60)
                    //.frame(width: geometryProxy.size.width)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Text("Mission Highlights")
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(Text(mission.displayName))
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MissionView_Previews: PreviewProvider {
    
    // MARK: - PROPERTIES
    static let missions: Array<Mission> = Bundle.main.decode("missions.json")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MissionView(mission: missions[5])
            .preferredColorScheme(.dark)
    }
}
