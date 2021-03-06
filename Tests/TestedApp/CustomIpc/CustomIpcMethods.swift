#if DEBUG

import MixboxInAppServices
import MixboxIpc
import TestsIpc

final class CustomIpcMethods {
    private let uiEventHistoryProvider: UiEventHistoryProvider
    
    init(uiEventHistoryProvider: UiEventHistoryProvider) {
        self.uiEventHistoryProvider = uiEventHistoryProvider
    }
    
    func registerIn(_ mixboxInAppServices: MixboxInAppServices) {
        // For Echo Ipc tests
        mixboxInAppServices.register { _ in EchoIpcMethodHandler<String>() }
        mixboxInAppServices.register { _ in EchoIpcMethodHandler<Int>() }
        mixboxInAppServices.register { _ in EchoIpcMethodHandler<IpcVoid>() }
        mixboxInAppServices.register { _ in EchoIpcMethodHandler<Bool>() }
        mixboxInAppServices.register { _ in EchoIpcMethodHandler<[String]>() }
        mixboxInAppServices.register { _ in EchoIpcMethodHandler<[String: String]>() }
        
        // For Bidirectional Ipc tests
        mixboxInAppServices.register { dependencies in
            BidirectionalIpcPingPongMethodHandler(
                ipcClient: dependencies.ipcClient
            )
        }
        
        // For Callback tests
        mixboxInAppServices.register { _ in CallbackFromAppIpcMethodHandler<Int>() }
        mixboxInAppServices.register { _ in CallbackToAppIpcMethodHandler<Int, String>() }
        mixboxInAppServices.register { _ in NestedCallbacksToAppIpcMethodHandler() }
        
        // For Launching tests
        mixboxInAppServices.register { _ in ProcessInfoIpcMethodHandler() }
        
        // For Actions tests
        mixboxInAppServices.register { [uiEventHistoryProvider] _ in
            GetUiEventHistoryIpcMethodHandler(
                uiEventHistoryProvider: uiEventHistoryProvider
            )
        }
    }
}

#endif
