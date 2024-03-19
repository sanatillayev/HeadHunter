//
//  TabSection.swift
//  
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import Foundation

public enum TabSection: CaseIterable {
    case search
    case favorite
    case applied
    case chat
    case profile

    
    
    public var iconName: String {
        switch self {
        case .search: return "iconSearch"
        case .favorite: return "iconFavorite"
        case .applied: return "iconApplied"
        case .chat: return "iconChat"
        case .profile: return "iconProfile"
        }
    }

    public var tabTitle: String {
        switch self {
        case .search: return "Поиск"
        case .favorite: return "Избранное"
        case .applied: return "Отклики"
        case .chat: return "Сообщения"
        case .profile: return "Профиль"
        }
    }
}

