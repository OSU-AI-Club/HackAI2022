//
//  Welcome.swift
//  DermAI
//
//  Created by Mihir Joshi on 4/9/22.
//

import SwiftUI

struct Welcome: View {
    
    var body: some View {
        TabView {
//            HomePage().tabItem {
//                Image(systemName: "house")
//                Text("Home")
//            }
            
            DermAIHome().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            CameraView().tabItem {
                Image(systemName: "camera")
                Text("Scan")
            }
        }
    }
}


struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
