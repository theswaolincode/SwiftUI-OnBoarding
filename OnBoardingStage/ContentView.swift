//
//  ContentView.swift
//  OnBoardingStage
//
//  Created by Daniel Ayala on 6/4/23.
//

import SwiftUI

struct ContentView: View {
    @State var content = ContentViewModel.sample
    @State var selection = 0
        
    var body: some View {
        TabView(selection: $selection) {
            ForEach(content.indices) { i in
                OnBoardingPageView(pageModel: content[i])
                    .tag(content[i])
            }
        }
        .onChange(of: selection, perform: { newValue in
            print("Selected index is: \(newValue)")
        })
        .background(Image(content[selection].imageName).blur(radius: 50))
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnBoardingPageView: View {
    let pageModel: ContentViewModel
    var body: some View {
        ScrollView {
            VStack() {
                Text(pageModel.title)
                    .font(.largeTitle)
                    .bold()
                Spacer(minLength: 60)
                Image(pageModel.imageName)
                    .resizable()
                    .frame (minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:
                                350)
                    .clipShape(RoundedRectangle (cornerRadius: 30))
                VStack() {
                    Text(pageModel.subtitle)
                        .bold()
                    Text(pageModel.desc)
                        .foregroundColor(.gray)
                }
                Spacer()
                
            }
            .padding()
        }
     
    }
}

//struct onBoardingActionsView: View {
//    var body: some View {
//        HStack {
//            Spacer()
//            Button {
//                withAnimation {
//                    if selection < courses.count - 1 {
//                        selection += 1
//                    }
//                }
//            } label: {
//                if selection == courses.count - 1 {
//                    Image(systemName: "checkmark.circle")
//                        .font(.largeTitle)
//                } else {
//                    Image(systemName: "chevron.right.circle")
//                        .font(.largeTitle)
//                }
//            }
//        }
//        .padding()
//        .foregroundColor(.primary)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContentViewModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var subtitle: String
    var desc: String
    var imageName: String = ""
}

extension ContentViewModel {
    static var sample: [ContentViewModel] {
        [
            ContentViewModel(title: "SIGHT", subtitle: "The visual system, or sense of sight", desc: "The only thing worse than being blind is having sight but no vision.", imageName: "6520740"),
            ContentViewModel(title: "SMELL", subtitle: "The olfactory system", desc: "Does wisdom perhaps appear on the earth as a raven which is inspired by the smell of carrion?", imageName: "6515455"),
            ContentViewModel(title: "HEARING", subtitle: "The auditory system", desc: "No other sound can match the healing power of the sounds of nature.", imageName: "6520748"),
            ContentViewModel(title: "TOUCH", subtitle: "The somatosensory system", desc: "One touch of nature makes the whole world kind", imageName: "6520751"),
            ContentViewModel(title: "TASTE", subtitle: "The gustatory system", desc: "Searching nature I taste self but at one tankard, that of my own being.", imageName: "6520753")
        ]
    }
}
