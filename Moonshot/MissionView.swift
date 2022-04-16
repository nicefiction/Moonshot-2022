/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/showing-mission-details-with-scrollview-and-geometryreader

import SwiftUI

/// `MISSIONS`:
/*
 {
     "id": 1,
     "crew": [
         {
             "name": "grissom",
             "role": "Command Pilot"
         },
         {
             "name": "white",
             "role": "Senior Pilot"
         },
         {
             "name": "chaffee",
             "role": "Pilot"
         }
     ],
     "description": "Apollo 1, initially designated AS-204, was the first crewed mission of the United States Apollo program, the project to land the first men on the Moon.\n\nPlanned as the first low Earth orbital test of the Apollo command and service module, to launch on February 21, 1967, the mission never flew; a cabin fire during a launch rehearsal test at Cape Kennedy Air Force Station Launch Complex 34 on January 27 killed all three crew members—Command Pilot Virgil I. \"Gus\" Grissom, Senior Pilot Ed White, and Pilot Roger B. Chaffee—and destroyed the command module (CM).\n\nThe name Apollo 1, chosen by the crew, was made official by NASA in their honor after the fire."
 },
 */
/// `ASTRONAUTS`:
/*
 {
     "grissom": {
         "id": "grissom",
         "name": "Virgil I. \"Gus\" Grissom",
         "description": "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor."
     },
 */

struct MissionView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - NESTED TYPES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let mission: Mission
    let astronauts: Dictionary<String, Astronaut>
    
    
    
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
                    ScrollView(.horizontal,
                               showsIndicators: false) {
                        HStack {
                            ForEach(selectAstronauts(from: mission)) { (eachMissionAstronaut: Astronaut) in
                                NavigationLink {
                                    Text("Details from \(eachMissionAstronaut.name)")
                                } label: {
                                    HStack {
                                        Image(eachMissionAstronaut.id)
                                            .resizable()
                                            .frame(width: 104,
                                                   height: 72)
                                            .clipShape(Capsule())
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white,
                                                                  lineWidth: 1.0)
                                            )
                                        VStack(alignment: .leading) {
                                            Text(eachMissionAstronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(selectRole(for: eachMissionAstronaut.id))
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                }
        }
        .navigationTitle(Text(mission.displayName))
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    
    func selectAstronauts(from mission: Mission)
    -> Array<Astronaut> {
        
        var missionAstronauts = Array<Astronaut>()
        
        let astronautsArray: Array<Astronaut> = astronauts.keys.compactMap { (eachKey: String) in
            astronauts[eachKey]
        }
        
        let crewNameArray: Array<String> = mission.crew.map { (eachCrewMember: Mission.CrewRole) in
            eachCrewMember.name
        }
        
        for eachAstronaut in astronautsArray
        where crewNameArray.contains(where: { $0 == eachAstronaut.id }) {
            missionAstronauts.append(eachAstronaut)
        }
        
        return missionAstronauts
    }
    
    
    func selectRole(for astronautID: String)
    -> String {
        
        for eachCrewMember in mission.crew {
            if eachCrewMember.name == astronautID {
                return eachCrewMember.role
            }
        }
        
        return "N/A"
    }
    
    
    
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MissionView_Previews: PreviewProvider {
    
    // MARK: - PROPERTIES
    static let missions: Array<Mission> = Bundle.main.decode("missions.json")
    static let astronauts: Dictionary<String, Astronaut> = Bundle.main.decode("astronauts.json")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MissionView(mission: missions[5],
                    astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
