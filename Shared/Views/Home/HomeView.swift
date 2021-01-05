//
//  HomeView.swift
//  Phonebank (iOS)
//
//  Created by Philip Tam on 2020-12-25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchKey : String = "";
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 5, content: {
                HStack(alignment: .center, spacing: 20, content: {
                    RoundButton(image: UIImage(named: "add_client_icon"), text: "Add Client")
                    RoundButton()
                })
                TextField("", text: $searchKey)
                Rectangle().frame(height: 1)
                    .foregroundColor(.black)
                Rectangle().foregroundColor(.white)
            })
            .padding(.top, 10)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarLeading, content: {
                    EditButton().foregroundColor(.white)
                })
                ToolbarItem(placement: .principal) {
                    VStack(alignment: .center, spacing: nil, content: {
                        Text("Placeholder").foregroundColor(.white)
                    })
                }
                ToolbarItem (placement: .navigationBarTrailing, content: {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus").foregroundColor(.white)
                    }
                })
            })
        }
    }
    
    func addItem() {
        print("What")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HomeView()
            HomeView().previewDevice("iPad Pro (11-inch) (2nd generation)")
        }
    }
}

