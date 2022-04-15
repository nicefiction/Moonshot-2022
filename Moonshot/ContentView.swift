/// SOURCE:

import SwiftUI



struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let astronauts: Dictionary<String, Astronaut> = Bundle.main.decode("astronauts.json")
    let missions: Array<Mission> = Bundle.main.decode("missions.json")
    let adaptiveColumns: Array<GridItem> = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    ForEach(missions) { (eachMission: Mission) in
                        NavigationLink {
                            Text("Detail view \(eachMission.displayName).")
                        } label: {
                            VStack {
                                Image("\(eachMission.imageName)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,
                                           height: 100)
                                    .padding()
                                VStack {
                                    Text(eachMission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(eachMission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.50))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle(Text("Moonshot"))
            .background(.darkBackground)
            .preferredColorScheme(.dark)
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
