//
//  Resources.swift
//
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import Foundation
import SwiftUI

public extension String {
    enum Resources {
        public enum Images {
            
            // MARK: - Login
            public static let iconAuthBackground = "iconAuthBackground"
            public static let iconGoogle = "iconGoogle"
            public static let iconApple = "iconApple"
            
            //MARK: - Search
            public static let icProfileBackground = "icProfileBackground"
            public static let icSecondStepChatImage = "icSecondStepChatImage"

            //MARK: - Favorites
            public static let icChatBackground = "icChatBackground"
            public static let icChatCard = "icChatCard"

            //MARK: - Applied
            public static let icCancelM = "icCancelButton"
            public static let icNotLoadedImage = "icNotLoadedImage"
            public static let icLike = "icLike"
            public static let icLikeFill = "icLikeFill"
            public static let icEdit = "icEdit"
            public static let icDelete = "icDelete"
            
            // MARK: - Chat
            public static let icQuery = "icQuery"
            public static let icChatTrailingArrow = "icChatTrailingArrow"
            public static let icSettings = "icSettings"
            
            // MARK: - Profile
            public static let icPersonIcon = "icPersonIcon"
                        
        }
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
