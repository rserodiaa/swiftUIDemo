//
//  ListView.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 18/09/23.
//

import SwiftUI

struct FruitsModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let color: Color
    let quantity: Int
}

class FruitsVM: ObservableObject {
    @Published var fruits: [FruitsModel] = []
    
    func populateFruits() {
        fruits.append(contentsOf: [
                       FruitsModel(name: "Apple", color: Color.red, quantity: 2),
                       FruitsModel(name: "Banana", color: Color.yellow, quantity: 3),
                       FruitsModel(name: "Pears", color: Color.green, quantity: 6),
                       FruitsModel(name: "Orange", color: Color.orange, quantity: 9)
        ]
        )
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, offset: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: offset)
    }
    
    func addFruit(_ enteredFruit: String) {
        fruits.append(FruitsModel(name: enteredFruit, color: .cyan, quantity: 1))
    }
}


struct ListView: View {
    
    @StateObject var fruitsVM = FruitsVM()
    
    @State var veggies = ["Onion","Potato","Tomato","Beans"]
    @State var enteredFruit: String = ""
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("Fruits") {
                        ForEach(fruitsVM.fruits) { fruitVM in
                            HStack {
                                Circle()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(fruitVM.color)
                                
                                Text(fruitVM.name)
                                Spacer()
                                Text("Qty => \(fruitVM.quantity)")
                            }
                            
                        }
                        .onDelete(perform: fruitsVM.delete)
                        .onMove(perform: fruitsVM.move)
                    }

                    Section("Veggies") {
                        ForEach(veggies, id: \.self) { veggie in
                            Text(veggie)
                        }
                    }
                }
                .onAppear {
                    fruitsVM.populateFruits()
                }
                .navigationTitle("Fruits List")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(leading: EditButton())
                Spacer()
                
                VStack {
                    TextField("Enter Fruit", text: $enteredFruit)
                        .padding()
                        .cornerRadius(5)
                        .background(Color.gray.opacity(0.1).cornerRadius(10))
                    
                    
                    Button {
                        fruitsVM.addFruit(enteredFruit)
                    } label: {
                        Text("Add")
                            .padding()
                            .frame(maxWidth: .greatestFiniteMagnitude)
                            .background(Color.orange.cornerRadius(15))
                            .foregroundColor(Color.white)
                    }
                }
                .padding(.horizontal)
                Spacer()

            }
            
        }
        .tint(Color.orange)
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
