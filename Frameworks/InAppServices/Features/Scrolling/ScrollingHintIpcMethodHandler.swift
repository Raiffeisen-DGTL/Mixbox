#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxIpc
import MixboxIpcCommon

final class ScrollingHintIpcMethodHandler: IpcMethodHandler {
    let method = ScrollingHintIpcMethod()
    
    func handle(arguments: String, completion: @escaping (ScrollingHint) -> ()) {
        let viewId = arguments
        DispatchQueue.main.async {
            guard let view = AccessibilityUniqueObjectMap.shared.locate(uniqueIdentifier: viewId) as? UIView else {
                completion(.internalError("Вьюшка \(viewId) не найдена"))
                return
            }

            let result = ScrollingHintsProvider.instance.scrollingHint(forScrollingToView: view)
            completion(result)
        }
    }
}

#endif
