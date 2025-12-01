//
//  AnsiFilter.swift
//  VSSHKR
//
//  ANSI escape sequence filter
//  Ported from Android Kotlin version
//

import Foundation

struct AnsiFilter {
    static func stripAnsi(_ text: String) -> String {
        var result = text
        
        // Remove complete ANSI escape sequences (ESC [ ... letter)
        result = result.replacingOccurrences(
            of: #"\u{001B}\[[\d;?]*[a-zA-Z]"#,
            with: "",
            options: .regularExpression
        )
        
        // Remove any remaining ESC characters
        result = result.replacingOccurrences(of: "\u{001B}", with: "")
        
        // Remove standalone [ sequences that look like ANSI
        result = result.replacingOccurrences(
            of: #"\[\d+[;\d]*[a-zA-Z]"#,
            with: "",
            options: .regularExpression
        )
        
        // Remove control characters except essential ones
        result = result.replacingOccurrences(
            of: #"[\u{0000}-\u{0008}\u{000B}-\u{001F}\u{007F}]"#,
            with: "",
            options: .regularExpression
        )
        
        // Clean up multiple spaces
        result = result.replacingOccurrences(
            of: #" {3,}"#,
            with: "  ",
            options: .regularExpression
        )
        
        return result
    }
    
    static func stripAnsiAggressive(_ text: String) -> String {
        var result = text
        var previousLength = 0
        var iterations = 0
        let maxIterations = 15
        
        // Multiple passes to catch everything
        while iterations < maxIterations {
            previousLength = result.count
            
            // Remove complete sequences with ESC prefix
            result = result.replacingOccurrences(
                of: #"\u{001B}\[[^\u{001B}]*?[a-zA-Z]"#,
                with: "",
                options: .regularExpression
            )
            
            // Remove cursor positioning sequences
            result = result.replacingOccurrences(
                of: #"\[\d+;\d+[Hf]"#,
                with: "",
                options: .regularExpression
            )
            
            // Remove color/format codes
            result = result.replacingOccurrences(
                of: #"\[[\d;]*m"#,
                with: "",
                options: .regularExpression
            )
            
            // Remove clear line/display sequences
            result = result.replacingOccurrences(
                of: #"\[[\d]*[KJX]"#,
                with: "",
                options: .regularExpression
            )
            
            if result.count == previousLength {
                break
            }
            iterations += 1
        }
        
        // Remove control characters but keep essential ones
        result = result.replacingOccurrences(
            of: #"[\u{0000}-\u{0007}\u{000B}-\u{000C}\u{000E}-\u{001F}]"#,
            with: "",
            options: .regularExpression
        )
        
        // Remove bell
        result = result.replacingOccurrences(of: "\u{0007}", with: "")
        
        // Remove any remaining ESC
        result = result.replacingOccurrences(of: "\u{001B}", with: "")
        
        return result
    }
}

