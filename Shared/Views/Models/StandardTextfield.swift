import SwiftUI

struct StandardTextfield: View {
    
    @State private var input: String = ""
    @State private var tempPlaceholder : String = ""
    @State private var placeholder : String = "Placeholder"
    
    var localizedStringKey : String
    var secureTextField: Bool = false
    var actionOnCommit : (String) -> Void
    var keyboard : UIKeyboardType = .emailAddress
    var title: String = "Placeholder"
    
    var width : CGFloat = 255
    var height : CGFloat = 35
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            if secureTextField {
                SecureField(placeholder, text: $input, onCommit: {
                    actionOnCommit(self.input)
                })
                .frame(width: self.width, height: self.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Caladea", fixedSize: 20))
                .animation(.linear(duration: 0.2))
            } else {
                TextField(placeholder, text: $input, onCommit : {
                    actionOnCommit(self.input)
                })
                .keyboardType(self.keyboard)
                .frame(width: self.width, height: self.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Caladea", fixedSize: 20))
                .animation(.linear(duration: 0.2))
                
            }
            Rectangle()
                .frame(width: self.width, height: 1)
            Text(title)
                .font(.custom("Caladea", fixedSize: 10))
                .foregroundColor(.gray)
                .animation(.linear(duration: 0.3))
        })
    }
}

struct StandardTextfield_Previews: PreviewProvider {
    
    static var previews: some View {
        StandardTextfield(localizedStringKey: "Username", secureTextField: false, actionOnCommit: { input in
            print(input)
        }) .previewLayout(.sizeThatFits)
        StandardTextfield(localizedStringKey: "Password", secureTextField: true, actionOnCommit: { input in
            print(input)
        }) .previewLayout(.sizeThatFits)
    }
}
