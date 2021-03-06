import CoreMotion

func ~= (lhs: CMRotationRate, rhs: CMRotationRate) -> Bool {
    let acceptableMargin = 0.1
    
    let candidate = [
        lhs.x - rhs.x,
        lhs.y - rhs.y,
        lhs.z - rhs.z
    ]
    
    return candidate
        .map(abs)
        .map { $0 < acceptableMargin }
        .reduce(true) { $0 && $1 } // all true
}

extension CMRotationRate: Comparable {
    public static func ==(lhs: CMRotationRate, rhs: CMRotationRate) -> Bool {
        return [
            lhs.x == rhs.x,
            lhs.y == rhs.y,
            lhs.z == rhs.z
        ].allTrue
    }

    public static func <(lhs: CMRotationRate, rhs: CMRotationRate) -> Bool {
        return lhs ~= rhs
    }
}
