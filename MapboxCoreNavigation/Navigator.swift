import Foundation
import MapboxNavigationNative

extension Navigator {
    func status(at timestamp: Date) -> NavigationStatus {
        // Because `FixLocation(_:)` passes in 0 as `monotonicTimestampNanoseconds`, we need to always call `getStatusForTimestamp(_:)` instead of `getStatusForMonotonicTimestampNanoseconds(_:)`.
//        return getStatusForTimestamp(timestamp)
        return getStatusForMonotonicTimestampNanoseconds(Int64(timestamp.timeIntervalSince1970) / 1000000000)
    }
}
