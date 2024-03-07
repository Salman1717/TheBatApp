//
//  Extensions.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import Foundation
import SwiftUI

extension Text{
    func ThemeTitle() -> some View {
        self.font(.custom("Changa-Bold", size: 32))
            .foregroundStyle(.white)
    }
    
    func textBody() -> some View {
        self.font(.custom("Changa-Regular", size: 24))
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
    }
    
    func Formheader() -> some View {
        self.font(.custom("Changa-Regular", size: 20))
            .foregroundStyle(.cyan)
            .multilineTextAlignment(.leading)
    }
    
    func buttonText() -> some View {
        self.font(.custom("Changa-Regular", size: 26))
        
    }
    
    func InfoHead() -> some View {
        self.font(.custom("Changa-Regular", size: 26))
            .foregroundStyle(.cyan)
    }
    func InfoBody() -> some View {
        self.font(.custom("Changa-Regular", size: 22))
            .foregroundStyle(.white)
            .fixedSize(horizontal: false, vertical: true)
    }
}
