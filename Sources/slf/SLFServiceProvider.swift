//
// Created by Fredrik Pettersson on 06/04/2018.
//

import Foundation

public protocol SLFServiceProvider {

    func getLogger(name: String) -> Logger
}
