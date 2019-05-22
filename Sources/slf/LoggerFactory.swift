//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation

public class LoggerFactory {

    private static var provider: SLFServiceProvider = NoOpServiceProvider()

    public class func use(provider: SLFServiceProvider) {
        self.provider = provider
    }

    public class func getLogger(_ object: Any) -> Logger {
        return getLogger(name: String(describing: object))
    }

    public class func getLogger(name: String) -> Logger {
        return getServiceProvider().getLogger(name: name)
    }

    public class func getServiceProvider() -> SLFServiceProvider {
        return provider
    }
}
