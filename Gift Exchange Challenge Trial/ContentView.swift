//
//  ContentView.swift
//  Gift Exchange Challenge Trial
//
//  Created by admin on 5/4/25.
//

import SwiftUI

struct ContentView: View {
    var gifter = ["Bob", "Suzy", "Floyd", "Jessica", "John"]
    
    @State var reciever:[String] = []
    
    func compareArrays(first:[String], second:[String])->Bool{
        if first.count != second.count {
            return false
        }
        for i in 0..<first.count{
            if first[i] == second[i]{
                return false
            }
        }
        
        return true
    }
   
    func generatePartnerArray(){
        var matches:[String] = []
        
        for person in gifter{
            matches.append(person)
        }
        
        var uniqueMatches = false
        
        while (!uniqueMatches){
            matches.shuffle()
            uniqueMatches = compareArrays(first: gifter, second: matches)
        }
        
        reciever = matches
    }
    
    var body: some View {
        VStack {
            
            Text("🎁 Exchange")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            ForEach (0..<gifter.count, id:\.self){
                index in
                HStack{
                    PersonView(name: gifter[index])
                    if reciever.count >  index {
                        Text("->")
                        PersonView(name: reciever[index])
                    }else {
                        PersonView(name: "??")
                    }
                }
            }
            
            Spacer()
            Button {
                generatePartnerArray()
            } label: {
                Text("Match People Up")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
          

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
