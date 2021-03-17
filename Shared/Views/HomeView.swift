//
//  ContentView.swift
//  Shared
//
//  Created by Jared on 3/15/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewObject = HomeViewObject.shared
    
    var body: some View {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        //UINavigationBar.appearance().backgroundColor = UIColor(named: "background")
        
        return ZStack {
            Color("background")
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(self.homeViewObject.activeClubhouses, id: \.roomId, content: {
                            clubhouse in
                            ClubhouseCell(clubhouse: clubhouse)
                        })
                    }
                }.background(Color("background").edgesIgnoringSafeArea(.all))
                .navigationBarTitle("", displayMode: .inline)
                .overlay(VStack { LinearGradient(gradient: Gradient(colors: [Color("background"), Color("background"), Color("white").opacity(0)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).frame(height: 50, alignment: .center)
                    Spacer()
                })
                .navigationBarItems(leading: Button(action: {}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(Color("black"))
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }), trailing: HStack(spacing: 25) {
                    Button(action: {}, label: {
                    Image(systemName: "envelope.open").foregroundColor(Color("black"))
                    }).font(.system(size: 19, weight: .semibold, design: .rounded))
                    Button(action: {}, label: {
                        Image(systemName: "calendar").foregroundColor(Color("black"))
                    }).font(.system(size: 22, weight: .semibold, design: .rounded))
                    Button(action: {}, label: {
                    Image(systemName: "bell").foregroundColor(Color("black"))
                    }).font(.system(size: 20, weight: .semibold, design: .rounded))
                    Button(action: {}, label: {
                        Image("testImage").resizable().aspectRatio(contentMode: .fill).frame(width: 30, height: 30, alignment: .center).clipped().cornerRadius(10).foregroundColor(Color("black"))
                    })
                })
            }.overlay(VStack {
                Spacer()
                LinearGradient(gradient: Gradient(colors: [Color("white").opacity(0), Color("background")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all).frame(height: 100, alignment: .center)
            })
        }
    }
}

struct ClubhouseCell : View {
    var clubhouse : Clubhouse
    var body: some View {
        VStack {
            HStack {
                Text(clubhouse.title).bold()
                Spacer()
            }.padding(.leading)
            HStack(alignment: .top) {
                Image("testImage").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(20)
                VStack(alignment: .leading) {
                    ForEach(clubhouse.users, id: \.id, content: {
                        user in
                        Text(user.name).padding(.bottom, 1)
                    }).font(Font.system(size: 15, weight: .light, design: .rounded))
                    HStack {
                        Text(String(clubhouse.numOfPeople))
                        Image(systemName: "person.fill")
                        Text("/")
                        Text(String(clubhouse.numOfSpeakers))
                        Image(systemName: "message.fill")
                    }.foregroundColor(Color.gray.opacity(0.5)).font(Font.system(size: 12, weight: .bold, design: .rounded))
                }.padding(.leading)
                Spacer()
            }.padding(.leading)
        }.padding().background(Color("white")).cornerRadius(30).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).shadow(color: Color("shadow"), radius: 1, x: 0, y: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
