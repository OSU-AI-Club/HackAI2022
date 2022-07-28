//
//  HomePage.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/10/22.
//

import SwiftUI

struct DermAIHome: View {
    
    let logo = UIImage(named: "DermAI.png")!
    
    var body: some View {
        VStack {
            Image(uiImage: logo).padding()
            Text("DermAI is an AI-based tool to assist physicians in making skin cancer diagnoses. At DermAI, our goal is to provide the highest accuracy prediction of common skin cancers to aid clinicians in making difficult decisions. Head over to the 'Scan' tab to begin!").lineLimit(nil).padding()
        }
        
    }
}

struct DermAIHome_Previews: PreviewProvider {
    static var previews: some View {
        DermAIHome()
    }
}
