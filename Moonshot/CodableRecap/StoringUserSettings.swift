/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults
/// For standard Swift objects:

import SwiftUI



struct StoringUserSettings: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var tappedNumber: Int = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("currentNumber") var currentNumber: Int = 0
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        HStack(spacing: 20) {
            Button("Tap \(tappedNumber)",
                   action: {
                tappedNumber += 1
                UserDefaults.standard.set(tappedNumber,
                                          forKey: "Tap")
            })
            .buttonStyle(.bordered)
            
            Button("Tap \(currentNumber)") {
                currentNumber += 1
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct StoringUserSettings_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StoringUserSettings()
    }
}
