/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/finishing-up-with-one-last-view

import SwiftUI



struct AstronautView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - NESTED TYPES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let astronautFromMissionCrew: Astronaut
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        ScrollView {
            VStack {
                Image(astronautFromMissionCrew.id)
                    .resizable()
                    .scaledToFit()
                Text(astronautFromMissionCrew.description)
                    .padding()
            }
        }
        .navigationTitle(astronautFromMissionCrew.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct AstronautView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static var astronauts: Dictionary<String, Astronaut> = Bundle.main.decode("astronauts.json")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AstronautView(astronautFromMissionCrew: astronauts["aldrin"]!)
    }
}
