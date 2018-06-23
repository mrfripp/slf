//
// Created by Fredrik Pettersson on 23/03/2018.
//

import Foundation

extension String {

    func leftPadding(length: Int) -> String {
        if self.count < length {
            return String(repeating: " ", count: length - self.count) + self
        } else {
            let indexStart = self.index(self.startIndex, offsetBy: self.count - length)
            return String(self[indexStart...])
        }
    }

    func rightPadding(length: Int) -> String {
        return self.padding(toLength: length, withPad: " ", startingAt: 0)
    }
}
