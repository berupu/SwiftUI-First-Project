//
//  Home.swift
//  FirstSwiftUIbeRUPU
//
//  Created by be RUPU on 27/11/21.
//

import SwiftUI

let statusBarHeight = UIApplication.shared.statusBarFrame.height
let screen = UIScreen.main.bounds

struct Home: View {
    
    
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .padding()
                .blur(radius: show ? 20 :0)
                .scaleEffect(showProfile ?  0.95 : 1)
                .animation(.default)
            
            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? statusBarHeight+40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? statusBarHeight : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? statusBarHeight : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background"))
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        Home().previewDevice("iPhone SE ")
//        Home().previewDevice("iPhone Xr")
//        Home().previewDevice("iPad Pro (9.7-inch)")
        Home().previewDevice("iPhone 11")
        
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color.black)
                .frame(width: 32, height: 32, alignment: .center)
            Text(text)
                .foregroundColor(.primary)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Settings", icon: "gear"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    
    //var menuItems = ["My Account", "Billing", "Team", "Sign out"]
    var menu = menuData
    @Binding var show: Bool
    @State var showSettings = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20.0) {
                
                ForEach(menu) {item in
                    if item.title == "Settings" {
                            MenuRow(image: item.icon, text: item.title)
                             .sheet(isPresented: self.$showSettings, content: {
                                Settings()
                            })
                             .onTapGesture {
                                 self.showSettings.toggle()
                             }
                            
                    } else{
                        MenuRow(image: item.icon, text: item.title)
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0,maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
        .padding(.top, statusBarHeight)
    }
}

struct CircleButton: View {
    
    var icon = "person.crop.circle"
    
    var body: some View {
        HStack() {
            
            Image(systemName: icon)
                .foregroundColor(.primary)
            
        }
        
        .frame(width: 44, height: 44)
        .background(Color("button"))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Button(action: {self.show.toggle() }) {
                HStack() {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                    
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color("button"))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
            }
            //Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MenuRight: View {
    
    @Binding var show: Bool
    @State var showUpdate = false
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: {self.show.toggle() }) {
                    CircleButton(icon: "bell")
                        .sheet(isPresented: self.$show, content: {
                            UpdateList()
                        })
                }
            }
            //Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}
