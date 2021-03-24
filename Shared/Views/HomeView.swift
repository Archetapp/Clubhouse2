//
//  ContentView.swift
//  Shared
//
//  Created by Jared on 3/15/21.
//

import SwiftUI

enum CardStates : CGFloat {
    case top = 300
    case middle = 50
    case bottom = -70
}

class CardState : ObservableObject {
    static let shared = CardState()
    private init() {}
    @Published var currentCardState : CardStates = .middle
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct HomeView: View {
    @ObservedObject var cardState = CardState.shared
    @ObservedObject var homeViewObject = HomeViewObject.shared
    @State private var offset = CGSize(width: 0, height: UIScreen.main.bounds.height * 0.6)
    @GestureState private var dragState = DragState.inactive

    var body: some View {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        //UINavigationBar.appearance().backgroundColor = UIColor(named: "background")
        
        return
            GeometryReader(content: { geometry in
                ZStack {
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
                    
                    CardView()
                        .offset(y: self.cardState.currentCardState == .top ? self.cardState.currentCardState.rawValue + self.dragState.translation.height : (geometry.size.height - self.cardState.currentCardState.rawValue) + self.dragState.translation.height)
                        
                        
//                        .offset(y: self.cardObject.currentCardPosition == .allTheWay ? self.cardObject.currentCardPosition.rawValue + self.dragState.translation.height : ( geometry.size.height - self.cardObject.currentCardPosition.rawValue) + self.dragState.translation.height)
                        
                        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                        .gesture(DragGesture()
                                    .updating($dragState, body: { (gesture, state, transaction) in
                                        state = .dragging(translation: gesture.translation)
                                    }).onEnded(onDragEnded))
                }
            })
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
       let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        print(verticalDirection)
        if verticalDirection > 100 {
            self.cardState.currentCardState = .middle
        } else if verticalDirection < -50 && verticalDirection > 300 {
            self.cardState.currentCardState = .middle
        } else if verticalDirection < -150 {
            self.cardState.currentCardState = .top
        } else {
            self.cardState.currentCardState = .middle
        }
    }
}

struct CardView : View {
    var body: some View {
        ZStack {
            Color("white")
            VStack{
                Text("HELLO WORLD!").bold()
            }
        }.clipShape(RoundedRectangle(cornerRadius: 20))
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

