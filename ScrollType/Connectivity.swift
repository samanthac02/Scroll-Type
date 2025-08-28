//
//  Connectivity.swift
//  ScrollType
//
//  Created by Samantha Chang on 3/22/21.
//

import SwiftUI
import WatchConnectivity

final class MessageListViewModel: NSObject {
    var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension MessageListViewModel: WCSessionDelegate {
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) { }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    #endif
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("")
        } else {
            print("This session has completed activation")
        }
    }
    
    func sendMessage() {
        let message: [String : Any] = ["isPro" : true]
        session.sendMessage(message, replyHandler: nil, errorHandler: { error in
            print("error")
        })
    }
    
}


