//: Playground - noun: a place where people can play

import UIKit

let now = Date().description
let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7)

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        if secondsAgo < minute {
            if secondsAgo > 1 {
                return "\(secondsAgo) seconds ago"
            }else{
                return "\(secondsAgo) second ago"
            }
        }else if secondsAgo < hour {
            if secondsAgo / minute > 1 {
                return "\(secondsAgo / minute) minutes ago"
            }else{
                return "\(secondsAgo / minute) minute ago"
            }
        }else if secondsAgo < day {
            if secondsAgo / hour > 1 {
                return "\(secondsAgo / hour) hours ago"
            }else{
                return "\(secondsAgo / hour) hour ago"
            }
        }else if secondsAgo < week {
            if secondsAgo / day > 1 {
                return "\(secondsAgo / day) days ago"
            }else {
                return "\(secondsAgo / day) day ago"
            }
        }
        if secondsAgo / week > 1 {
            return "\(secondsAgo / week) weeks ago"
        }else{
            return "\(secondsAgo / week) week ago"
        }
    }
}
pastDate.timeAgoDisplay()

