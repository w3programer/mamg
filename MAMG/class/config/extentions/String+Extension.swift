
import Foundation
extension String {
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
extension Optional {
    func getOrElse<T>(defaultValue: T) -> T {
        if let value = self {
            return value as! T
        } else {
            return defaultValue
        }
    }
}
