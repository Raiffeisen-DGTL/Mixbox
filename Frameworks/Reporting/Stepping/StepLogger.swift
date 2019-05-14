import MixboxArtifacts

public final class StepLoggerResultWrapper<T> {
    public let stepLogAfter: StepLogAfter
    public let wrappedResult: T
    
    public init(
        stepLogAfter: StepLogAfter,
        wrappedResult: T)
    {
        self.stepLogAfter = stepLogAfter
        self.wrappedResult = wrappedResult
    }
}

// Допустим, есть код:
//
// let myResult: (MyResult) = getMyResult() // Не optional
// return myResult
//
// Можно его положить в логируемый шаг:
//
// let myResult: (MyResult) = stepLogger.logStep {
//     let myResult = getMyResult()
//     return StepLoggerWrappedCodeResult(
//         stepLogAfter = StepLogAfter(
//             wasSuccessful: myResult.someCombinableStuff.reduce(true) { $0 && $1 }
//             artifacts: myResult.getArtifacts() + makeDefaultArtifacts()
//         )
//     )
// }
//
// На выходе получаем то, что и раньше, при том что вклинились в процесс со своим логгированием
//
public protocol StepLogger: class {
    // Returns StepLoggerResultWrapper<T> instead of T, because it is easier to nest one logger into another
    // and intercept all data.
    
    func logStep<T>(
        stepLogBefore: StepLogBefore,
        body: () -> StepLoggerResultWrapper<T>)
        -> StepLoggerResultWrapper<T>
}

public extension StepLogger {
    // Для простой записи в логе без древовидности
    func logEntry(
        date: Date = Date(),
        description: String,
        artifacts: [Artifact])
    {
        let stepLogBefore = StepLogBefore.other(description, artifacts: artifacts, date: date)
        _ = logStep(stepLogBefore: stepLogBefore) { () -> StepLoggerResultWrapper<()> in
            StepLoggerResultWrapper(
                stepLogAfter: StepLogAfter(
                    wasSuccessful: true,
                    artifacts: []
                ),
                wrappedResult: ()
            )
        }
    }
}

public enum StepType {
    // TODO: Remove these types:
    case testWarehouseStep
    case testWarehouseAssertion
    case testWarehousePrecondition
    // Maybe remove types at all and introduce tags or custom dictionaries/codable objects
    
    case interaction
    case other
}

public final class StepLogBefore {
    public let date: Date
    public let identifyingDescription: String // TODO: Remove this
    public let detailedDescription: String
    public let stepType: StepType
    public let artifacts: [Artifact]
    
    public init(
        date: Date = Date(),
        identifyingDescription: String,
        detailedDescription: String,
        stepType: StepType,
        artifacts: [Artifact])
    {
        self.date = date
        self.identifyingDescription = identifyingDescription
        self.detailedDescription = detailedDescription
        self.stepType = stepType
        self.artifacts = artifacts
    }
    
    public static func other(_ description: String, artifacts: [Artifact] = [], date: Date = Date()) -> StepLogBefore {
        return StepLogBefore(
            date: date,
            identifyingDescription: description,
            detailedDescription: description,
            stepType: .other,
            artifacts: artifacts
        )
    }
}

public final class StepLogAfter {
    public let date: Date
    public let wasSuccessful: Bool
    public let artifacts: [Artifact]
    
    public init(
        date: Date = Date(),
        wasSuccessful: Bool,
        artifacts: [Artifact])
    {
        self.date = date
        self.wasSuccessful = wasSuccessful
        self.artifacts = artifacts
    }
}
