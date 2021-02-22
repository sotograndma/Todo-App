//
//  SettingsView.swift
//  Todo App
//
//  Created by Dzaky Saputra on 22/02/21.
//

import SwiftUI



struct SettingsView: View {
  
    @Environment(\.presentationMode) var presentationMode
  
    var body: some View {
      NavigationView{
        VStack(alignment: .center, spacing: 0){
          
          Form{
            
            Section(header: Text("Follow us on social media")){
              FormRowLinkView(icon: "globe", color: Color.pink, text: "website", link: "https://swiftuimasterclass.com")
              FormRowLinkView(icon: "link", color: Color.blue, text: "twitter", link: "https://swiftuimasterclass.com")
              FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "course", link: "https://swiftuimasterclass.com")
            }
            .padding(.vertical, 3)
            
            Section(header: Text("About the application")){
              FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
              FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "Iphone, Ipad")
              FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Dzaky / Great")
              FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Edi Sunardi")
              FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
            }
            .padding(.vertical, 3)
          }
          .listStyle(GroupedListStyle())
          .environment(\.horizontalSizeClass, .regular)
          
          Text("Copyright Allrights reserved.\nbetter Apps less code")
            .multilineTextAlignment(.center)
            .font(.footnote)
            .padding(.top, 6)
            .padding(.bottom, 8)
            .foregroundColor(Color.secondary)
        }
        .navigationBarItems(trailing:
                              Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                              }){
                                Image(systemName: "xmark")
                              }
        )
        .navigationBarTitle("Settings", displayMode: .inline)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
      }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
