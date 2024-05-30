//
//  HeaderView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI

struct HeaderView: View {
    var backgroundColor: Color
       var mainText: String
       var subText: String
    var inclineAngle : Double
    var offset : Double
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:0).foregroundColor(backgroundColor).rotationEffect(Angle(degrees: inclineAngle))
            VStack{
                Text(mainText).font(.system(size:50)).foregroundColor(.white).bold()
                Text(subText).font(.system(size:30)).foregroundColor(.white)
            }
        
        }.frame(width: UIScreen.main.bounds.width * 3 , height: 300).offset(y: offset)
    }
}

#Preview {
    HeaderView(
            backgroundColor: .blue,
            mainText: "Title",
            subText: "Sub Title",
            inclineAngle :15,
            offset: -150
           
        )
}
