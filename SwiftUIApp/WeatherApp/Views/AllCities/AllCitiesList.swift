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
    @State var textFieldColor: Color = .white
    @State var showToast = false
    
    var body: some View {
        ScrollView {
            navigationBar
                .tint(.black)
            
            VStack {
                    ForEach(viewModel.cities) { city in
                        if viewModel.cities.count == 1 {
                            CityRow(cityName: city.cityName,
                                    imageName: city.imageName,
                                    isEditMode: false,
                                    deletedCity: deleteCity)
                        } else {
                            CityRow(cityName: city.cityName,
                                    imageName: city.imageName,
                                    isEditMode: isEditMode,
                                    deletedCity: deleteCity)
                        }
                    }
            }
            .padding()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 40).fill(.purple))
            .padding(.horizontal, 25)
            
            addCityView
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
                withAnimation {
                    isEditMode.toggle()
                }
                
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
    
    private var addCityView: some View {
        VStack {
            TextField("Enter City", text: $viewModel.addCity)
                    .modifier(ShakeEffect(shakes: viewModel.shouldShake ? 2 : 0))
                    .animation(Animation.default.repeatCount(1).speed(1))
                    .padding(25)
                    .background(textFieldColor)
                    .cornerRadius(15)
                .padding([.horizontal, .top], 25)

            Button {
                addNewCity()
            } label: {
                Text("Add City")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(.purple))
            .padding(.vertical, 8)
            .padding(.horizontal, 125)
            
            Text("Please enter valid city name")
                .foregroundColor(.gray)
                .offset(y: showToast ? 0 : 600)
                
        }
    }
    
    private func addNewCity() {
        let bgColor = Color.red.opacity(0.2)
        let isValid = viewModel.addNewCity()
        if !isValid {
            
            withAnimation(.easeOut(duration: 0.2)) {
                showToast = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                withAnimation(.easeOut(duration: 0.6)) {
                    showToast = false
                }
            }
            
            withAnimation(.easeOut(duration: 1)) {
                textFieldColor = bgColor
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.easeOut(duration: 0.6)) {
                    textFieldColor = .white
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

struct ShakeEffect: GeometryEffect {
        func effectValue(size: CGSize) -> ProjectionTransform {
            return ProjectionTransform(CGAffineTransform(translationX: -10 * sin(position * 2 * .pi), y: 0))
        }
        
        init(shakes: Int) {
            position = CGFloat(shakes)
        }
        
        var position: CGFloat
        var animatableData: CGFloat {
            get { position }
            set { position = newValue }
        }
    }
