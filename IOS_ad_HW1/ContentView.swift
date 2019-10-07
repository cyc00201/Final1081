//
//  ContentView.swift
//  IOS_ad_HW1
//
//  Created by User06 on 2019/10/2.
//  Copyright © 2019 User06. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var tofusizes :[String] = ["小的", "中的", "大的"]
    @State private var selectedIndex = 0
    @State private var sred: Double = 1
    @State private var sgreen: Double = 1
    @State private var sblue: Double = 1
    @State private var istofu: Bool = false
    @State private var showalert : Bool = false
    @State private var select_date = DateComponents(calendar:Calendar.current, year: 2004, month: 3, day: 1).date!
    @State private var saying :String = "我叫言峰綺禮"
    let start_date = DateComponents(calendar:Calendar.current, year: 1994, month: 3, day: 1).date!
    let end_date = DateComponents(calendar:Calendar.current, year: 2006, month: 12, day: 31).date!
    let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .short
       return dateFormatter
    }()
 
    var body: some View {
         NavigationView{
            GeometryReader{(geometry)in
                VStack{
                    if self.istofu == false{
                        HStack{
                            
                            call_sinfu(sred:self.$sred,sgreen:self.$sgreen,sblue:self.$sblue,saying:self.$saying, select_date: self.select_date)
                       Text("1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111")
                            .foregroundColor(.red)
                            .frame(width:130)
                            .background(Color.red)
                            .padding(-420)
                        }
                    }
                    else{
                        ZStack{
                            call_sinfu(sred:self.$sred,sgreen:self.$sgreen,sblue:self.$sblue,saying:self.$saying, select_date: self.select_date)
                            Image(self.tofusizes[self.selectedIndex])  .resizable()
                                .scaledToFill()
                                .colorMultiply(Color(red: self.sred, green: self.sgreen, blue: self.sblue, opacity:1))
                                .frame(width: 200, height: 200)
                                .clipped()
                        }
                        
                    }
                    
                    
                    Form{
                        Button(action: {
                            self.showalert = true
                        }) {
                            Text("神父愛吃麻婆豆腐？\n(按了就知道)").frame(alignment:.center)
                        }.alert(isPresented: self.$showalert) { () -> Alert in
                           let answer = ["愛", "不愛（騙人）"].randomElement()!
                           return Alert(title: Text(answer))
                        }
                        .frame(height: 60)
                       .background(Color.yellow)
                        Toggle(isOn: self.$istofu) {
                            Text(self.tofusizes[self.selectedIndex].appending("麻婆豆腐")).foregroundColor(.red)
                            }
                    
                       Slider(value: self.$sred, in: 0...1, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                            Text("")
                        }
                        
                        Slider(value: self.$sgreen, in: 0...1, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                                Text("")
                        }
                    
                        Slider(value: self.$sblue, in: 0...1, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                                Text("")
                        }
                        
                    DatePicker("神父時間",selection: self.$select_date, in: self.start_date...self.end_date, displayedComponents: .date)
                        
                        Picker("選豆腐量", selection: self.$selectedIndex){
                                    Text(self.tofusizes[0]).tag(0)
                                     Text(self.tofusizes[1]).tag(1)
                                Text(self.tofusizes[2]).tag(2)
                        }
                        
                        
                    }
                   
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct call_sinfu: View {
    @Binding var sred:Double
    @Binding var sgreen:Double
    @Binding var sblue:Double
    @Binding var saying :String
    let select_date: Date
    var year: Int {
        if (Calendar.current.component(.year, from: select_date) >= 2000){
        return 2004
        }
        else{
        return 1994
        }
    }
    
    var body: some View {
        
    
        GeometryReader{(geometry)in
        
            HStack {
                Image("sinfu\(self.year)")  .resizable()
                    .scaledToFill()
                    .colorMultiply(Color(red: self.sred, green: self.sgreen, blue: self.sblue, opacity:1))
                .frame(width:geometry.size.width,height:geometry.size.width*3/3)
                    .clipped()
                if self.year == 1994{
                    TextField("要給神父說的話", text:self.$saying).frame(width: 200, height: 50,alignment: .center)
                    .foregroundColor(.black)
                    .padding(-350)
                    .padding(.top,830)
                }
                else{
                    TextField("要給神父說的話", text:self.$saying).frame(width: 200, height: 50,alignment: .center)
                        .foregroundColor(.black)
                        .padding(-310)
                        .padding(.top,770)
                }
            }
             
        }
    }
}
