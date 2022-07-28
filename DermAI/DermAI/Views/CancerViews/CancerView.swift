//
//  CancerView.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/10/22.
//

import SwiftUI

struct CancerView: View {
    
    let tag:String
    
    init(tag: String) {
        self.tag = tag
    }
    
    let cancerTypes = ["Actinic Keratosis", "Basal Cell Carcinoma", "Pigmented Benign Keratosis", "Dermatofibroma", "Melanocytic nevi", "Melanoma", "Vascular Lesion"]
    
    var body: some View {
        NavigationView {
            
            if tag == "Actinic Keratosis" {
                Actinic_Keratosis()
            }
            else if tag == "Basal Cell Carcinoma" {
                Basal_Cell_Carcinoma()
            }
            else if tag == "Pigmented Benign Keratosis" {
                Pigmented_Benign()
            }
            else if tag == "Dermatofibroma" {
                Dermatofibroma()
            }
            else if tag == "Melanocytic nevi" {
                Melanocytic_nevi()
            }
            else if tag == "Melanoma" {
                Melanoma()
            }
            else if tag == "Vascular Lesion" {
                Vascular_Lesion()
            }
            
        }.navigationTitle(tag)
    }
}

struct CancerView_Previews: PreviewProvider {
    static var previews: some View {
        CancerView(tag: String.init())
    }
}
