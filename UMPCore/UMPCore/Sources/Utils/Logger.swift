//
//  Logger.swift
//  UMPCore
//
//  Created by 龚文 on 10/25/23.
//

import Foundation

public class Logger {
    private init(){}
    
    public static func d(message: String) {
        print("\(PluginManager.Tag) \(message)")
    }
}
