//
//  Results.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Results: View {
    
    // Get dictionary of predicted values
    let predictedValues:[String : Double]
    @State private var isPresented:Bool = false
    @State private var updatedIndex:Int = 0
    
        init(predictedValues: [String : Double]) {
            self.predictedValues = predictedValues
        }
    
    let cancerTypes = ["Actinic Keratosis", "Basal Cell Carcinoma", "Pigmented Benign Keratosis", "Dermatofibroma", "Melanocytic nevi", "Melanoma", "Vascular Lesion"]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
    var body: some View {
        NavigationView {
            
            LazyVGrid(columns: gridItemLayout, spacing: 5) {
                ForEach((0...cancerTypes.count - 1), id: \.self) { i in
                    Button {

                        isPresented.toggle()
                        updatedIndex = i

                    } label: {
                        VStack {
                            Text(String(cancerTypes[i])).font(.system(size: 13)).foregroundColor(.black)
                            Spacer()
                            Text(String(parsePredictedValues(dict: predictedValues)[i]) + "%")
                        }
                        
                    }.sheet(isPresented: $isPresented) {

                    } content: {
                        
                        CancerView(tag: cancerTypes[$updatedIndex.wrappedValue])
                    }
                    
                    .frame(width: 110, height: 100).cornerRadius(10).background(Color(uiColor: .lightGray))
                        
                }
            }
            //Text(predictedValues.keys.first!)
            
        }.navigationTitle("Results")
    }
    
    func parsePredictedValues(dict: [String : Double]) -> [Double] {
        let size = cancerTypes.count
        var predictedValues = [Double](repeating: 0.0, count: size) // initialize empty array of doubles
        
        var i = 0
        for (_, prediction) in dict {
            //let temp = prediction * 100.00
            predictedValues[i] = (prediction * 100.0).truncate(places: 2)
            i += 1
        }
        
        return predictedValues
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(predictedValues: [String : Double].init())
    }
}

// Truncate to x places in double
extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
