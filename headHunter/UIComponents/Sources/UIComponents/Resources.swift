//
//  Resources.swift
//
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import Foundation
import SwiftUI

public extension String {
    public enum Images {
        // MARK: - Tab
        public static let iconApplied = "iconApplied"
        public static let iconChat = "iconChat"
        public static let iconFavorite = "iconFavorite"
        public static let iconProfile = "iconProfile"
        public static let iconSearch = "iconSearch"

        public static let iconX = "iconX"

        //MARK: - Jobs
        public static let iconHeartFilled = "iconHeartFilled"
        public static let iconCheck = "iconCheck"
    }
}

public extension Color {
    
    enum AppColors {
        
        public static let clDarkGreen = Color("clDarkGreen")
        public static let clGreen = Color("clGreen")
        public static let clBaseBlue = Color("clBaseBlue")
        public static let clDarkBlue = Color("clDarkBlue")
        public static let clRed = Color("clRed")

        public static let clLabelPrimary = Color("clLabelPrimary")
        public static let clLabelSecondary = Color("clLabelSecondary")
        public static let clLabelDisabled = Color("clLabelDisabled")
        
        // MARK: - Chat

        public static let clBackgroundPrimary = Color("clBackgroundPrimary")
        public static let clBackgroundSecondary = Color("clBackgroundSecondary")
        public static let clBackgroundTertiary = Color("clBackgroundTertiary")
        
    }
}
