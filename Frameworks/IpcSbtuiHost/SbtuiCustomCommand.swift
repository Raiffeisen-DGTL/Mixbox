#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxIpc
import MixboxFoundation
import SBTUITestTunnelServer
    
final class SbtuiCustomCommand {
    private typealias HandleFunction = (_ request: NSObject?) -> (NSObject?)
    
    private let handleFunction: HandleFunction
    private let name: String
    
    init<MethodHandler: IpcMethodHandler>(ipcMethodHandler: MethodHandler) {
        handleFunction = { request in
            SbtuiCustomCommand.handle(request: request, usingIpcMethodHandler: ipcMethodHandler)
        }
        name = ipcMethodHandler.method.name
    }
    
    func register() {
        SBTUITestTunnelServer.registerCustomCommandNamed(sbtuiTestTunnelCommandName()) { [weak self] request in
            self?.handleFunction(request)
        }
    }
    
    func unregister() {
        SBTUITestTunnelServer.unregisterCommandNamed(sbtuiTestTunnelCommandName())
    }
    
    private func sbtuiTestTunnelCommandName() -> String {
        return "customCommand:\(name)"
    }
    
    private static func handle<MethodHandler: IpcMethodHandler>(
        request: NSObject?,
        usingIpcMethodHandler ipcMethodHandler: MethodHandler)
        -> NSObject?
    {
        guard let typedArguments: MethodHandler.Method.Arguments = decodeArguments(request) else {
            return nil
        }
        
        var typedReturnValue: MethodHandler.Method.ReturnValue?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        ipcMethodHandler.handle(arguments: typedArguments) { returnValue in
            typedReturnValue = returnValue
            dispatchGroup.leave()
        }
        
        dispatchGroup.wait()
        
        return typedReturnValue.flatMap { encodeReturnValue($0) }
    }
    
    private static func decodeArguments<T: Codable>(_ sbtuiRequest: NSObject?) -> T? {
        guard let serializedArguments = sbtuiRequest as? String else {
            return nil
        }
        
        return GenericSerialization.deserialize(string: serializedArguments)
    }
    
    private static func encodeReturnValue<T: Codable>(_ sbtuiResult: T) -> NSObject? {
        return GenericSerialization.serialize(value: sbtuiResult).flatMap { $0 as NSObject }
    }
}

#endif
