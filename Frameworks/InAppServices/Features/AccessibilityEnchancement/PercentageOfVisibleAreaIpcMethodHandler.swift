#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxIpc
import MixboxIpcCommon

final class PercentageOfVisibleAreaIpcMethodHandler: IpcMethodHandler {
    let method = PercentageOfVisibleAreaIpcMethod()
    
    func handle(arguments: String, completion: @escaping (CGFloat?) -> ()) {
        DispatchQueue.main.async {
            guard let view = AccessibilityUniqueObjectMap.shared.locate(uniqueIdentifier: arguments) as? UIView else {
                completion(nil)
                return
            }
        
            completion(view.percentageOfVisibleArea)
        }
    }
}

#endif
