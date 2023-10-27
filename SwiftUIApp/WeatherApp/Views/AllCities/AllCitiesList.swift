//
//  AllCitiesList.swift
//  SwiftUIApp
//
//  Created by Rahul Serodia on 26/10/23.
//

import SwiftUI

struct AllCitiesList: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: DummyViewModel
    @State var isEditMode = false
    
    var body: some View {
        ScrollView {
            navigationBar
                .tint(.black)
            VStack {
                    ForEach(viewModel.cities) { city in
                        CityRow(cityName: city.cityName,
                                imageName: city.imageName,
                                isEditMode: isEditMode,
                                deletedCity: deleteCity)
                    }
            }
            .padding()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 40).fill(.purple))
            .padding(.horizontal, 25)
            
            TextField("Enter City", text: $viewModel.addCity)
                .padding(25)
                .background(.white)
                .cornerRadius(15)
                .padding([.horizontal, .top], 25)
            
            Button {
                viewModel.addNewCity()
                viewModel.addCity = ""
            } label: {
                Text("Add City")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(.purple))
            .padding(.top, 8)
            .padding(.horizontal, 125)
        }
        .navigationBarHidden(true)
        .padding(.top, 50)
        .background(LinearGradient(colors: [Color(hex: 0xCF9FFF), Color(hex: 0xE0B0FF), Color(hex: 0xE6E6FA), .white], startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
    }
    
    private func deleteCity(cityName: String) {
        viewModel.deleteCity(city: cityName)
    }
    
    private var navigationBar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
            .padding()
            Spacer()
            Button(action: {
                isEditMode.toggle()
            }) {
                HStack {
                    if isEditMode {
                        Image(systemName: "checkmark.rectangle")
                            .imageScale(.large)
                            .padding(.trailing)
                    } else {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .padding(.trailing)
                    }
                    
                }
            }
        }
    }
}

struct AllCitiesList_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesList(viewModel: DummyViewModel())
    }
}
