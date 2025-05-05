//
//  ContentView.swift
//  Gift Exchange Challenge Trial
//
//  Created by admin on 5/4/25.
//

import SwiftUI

struct ContentView: View {
    var gifters = ["Bob", "Suzy", "Floyd", "Jessica", "John"]
    
    @State var receivers:[String] = []
    
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
   
    func generateReceiversArray(){
        var matches:[String] = []
        
        for person in gifters{
            matches.append(person)
        }
        
        var uniqueMatches = false
        
        while (!uniqueMatches){
            matches.shuffle()
            uniqueMatches = compareArrays(first: gifters, second: matches)
        }
        
        receivers = matches
    }
    
    var body: some View {
        VStack {
            
            Text("🎁 Exchange")
                .font(.largeTitle)
                .padding(.top, 20)
            
            Spacer()
            
            ForEach (0 ..< gifters.count, id:\.self){
                index in
                HStack{
                    PersonView(name: gifters[index])
                    Text("->")
                    if receivers.count >  index {
                        
                        PersonView(name: receivers[index])
                    }else {
                        PersonView(name: "??")
                    }
                }
            }
            
            Spacer()
            Button {
                generateReceiversArray()
            } label: {
                Text("Match People Up")
                    .bold()
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
