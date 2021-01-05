//
//  EditableButton.swift
//  Phonebank (iOS)
//
//  Created by Philip Tam on 2020-12-27.
//

import Foundation
import SwiftUI

struct RoundButton: View {
    var image: UIImage?
    var width : CGFloat = 158
    var height : CGFloat = 50
    var text: String = "Placeholder"
    var imagePadding : EdgeInsets = EdgeInsets()
    var fontSize : CGFloat = 20
    
    var body: some View {
        Button(action: {}) {
            HStack(alignment: .center, spacing: 5, content: {
                // Icon
                Image(uiImage: self.image ?? UIImage())
                    .renderingMode(.template)
                    .frame(width: self.image != nil  ? 25 : 0,
                           height: self.image != nil ? 25 : 0)
                // Label
                Text(text)
                    .underline()
                    .font(.custom("Caladea", fixedSize: self.fontSize))
            })
        }
        .frame(width: self.width, height: self.height, alignment: .center)
        .buttonStyle(RoundButtonStyle(width: self.width, height: self.height))
        
}
    
    struct RoundButtonStyle: ButtonStyle {
        var width : CGFloat
        var height : CGFloat
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
               .frame(width: self.width, height: self.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
              .foregroundColor(configuration.isPressed ? Color.white : Color.black)
              .background(configuration.isPressed ? Color.black : Color.white)
                .cornerRadius(self.height/2)
              .overlay(
                RoundedRectangle(cornerRadius: self.height/2 , style: .circular)
                    .stroke(Color.black, lineWidth: 1.0)
              )
          }
    }
}

struct EditableButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .previewLayout(.sizeThatFits)
        RoundButton(image: UIImage(named: "add_client_icon")!)
            .previewLayout(.sizeThatFits)
    }
}

