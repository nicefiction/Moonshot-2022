/// SOURCE:

import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let astronauts: Dictionary<String, Astronaut> = Bundle.main.decode("astronauts.json")
    let missions: Array<Mission> = Bundle.main.decode("missions.json")
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack(alignment: .leading,
               spacing: 20) {
            Text("Total number of astronauts: \(astronauts.count)")
            Text("Total number of missions: \(missions.count)")
        }
        .font(.title2)
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
