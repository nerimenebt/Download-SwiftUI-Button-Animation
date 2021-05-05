//
//  DownloaderModel.swift
//  DownloadButton
//
//  Created by Nerimene on 4/5/2021.
//

import SwiftUI

enum DownloadState: CaseIterable {
    
    case notInitiated
    case downloading
    case downloaded
    
    func getStateName() -> String {
        switch self {
        case .notInitiated:
            return "Download"
        case .downloading:
            return "Downloading"
        case .downloaded:
            return "Finished"
        }
    }
    
    func getBackground() -> Color {
        switch self {
        case .notInitiated:
            return Color(UIColor.label)
        case .downloading:
            return Color(red: 18/255, green: 140/255, blue: 126/255, opacity: 1.0)
        case .downloaded:
            return Color(red: 41/255, green: 121/255, blue: 255/255, opacity: 1.0)
        }
    }
    
    func offsetForText() -> CGFloat {
        switch self {
        case.notInitiated:
            return 0
        case .downloading:
            return 8
        case .downloaded:
            return 0
        }
    }
}

struct ButtonDimension {
    static let width: CGFloat = 320
    static let height: CGFloat = 76
    static let animationDuration: TimeInterval = 0.35
    static let cornerRadius: CGFloat = 12
}

class Downloader: ObservableObject {
    @Published var currentState: DownloadState = DownloadState.notInitiated
    // MARK:- inits
    init(state: DownloadState = .notInitiated) {
        self.currentState = state
    }
}
