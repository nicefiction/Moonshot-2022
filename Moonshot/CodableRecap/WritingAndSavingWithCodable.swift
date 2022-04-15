/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/building-a-list-we-can-delete-from
/// https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
/// `STEP 1`: Attempt to read the` “Items” `key from `UserDefaults`.
/// `STEP 2`: Create an instance of `JSONDecoder`, which is the counterpart of JSONEncoder that lets us go from JSON data to Swift objects.
/// `STEP 3`: Ask the decoder to convert the data we received from `UserDefaults` into an array of `ExpenseItem` objects.
/// `STEP 4`: If that worked, assign the resulting array to `items` and exit.
/// `STEP 5`: Otherwise, set items to be an empty array.

import SwiftUI



struct ExpenseItem: Codable {
    
    let name: String
    let price: Double
    let type: String
}





struct WritingAndSavingWithCodable: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var expenses = Array<ExpenseItem>() {
        didSet {
            let jsonEncoder = JSONEncoder.init()
            if let _encodedData = try? jsonEncoder.encode(expenses) {
                UserDefaults.standard.set(_encodedData,
                                          forKey: "ExpensesData")
                print("ARCHIVING \(_encodedData)")
            }
        }
    }
    @State private var count: Int = 1
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    init() {
        if let _savedData = UserDefaults.standard.data(forKey: "ExpensesData") {
            let jsonDecoder = JSONDecoder.init()
            if let _decodedData = try? jsonDecoder.decode(Array<ExpenseItem>.self,
                                                          from: _savedData) {
                expenses = _decodedData
                print("INITIALIZING \(_decodedData)")
                return
            }
        }
        self.expenses = expenses
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        List {
            Button("Create Expense") {
                let expenseItem = ExpenseItem.init(name: "Item \(count)",
                                                   price: 10.00,
                                                   type: "Personnal")
                expenses.append(expenseItem)
                count += 1
            }
            Text("There are \(expenses.count) items in the expenses list.")
                .font(.subheadline)
            ForEach(expenses,
                    id: \.name) { (eachExpenseItem: ExpenseItem) in
                Text("\(eachExpenseItem.name)")
            }
        }
    }
    
    
    
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct WritingAndSavingWithCodable_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WritingAndSavingWithCodable()
    }
}
