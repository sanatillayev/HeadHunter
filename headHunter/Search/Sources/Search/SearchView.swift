//
//  SearchView.swift
//  headHunter
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import UIComponents
import Router

struct SearchView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            Color.AppColors.clBackgroundPrimary.ignoresSafeArea()
            Text("Search View!")
                .foregroundStyle(Color.AppColors.clLabelPrimary)
                .onTapGesture {
//                    router.navigateBack()
                }
        }
        .navigationBarBackButtonHidden()
    }
}
