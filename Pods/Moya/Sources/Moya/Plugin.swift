import Foundation
import Result

/// A Moya Plugin receives callbacks to perform side effects wherever a request is sent or received.
///
/// for example, a plugin may be used to
///     - log network requests
///     - hide and show a network activity indicator
///     - inject additional information into a request
public protocol PluginType {
    /// Called to modify a request before sending.
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest

    /// Called immediately before a request is sent over the network (or stubbed).
    func willSend(_ request: RequestType, target: TargetType)

    /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType)

    /// Called to modify a result before completion.
    // 插件机制可以，提供接口；让外部实现这个协议的可以自行处理。结果
    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError>
}

//协议的一个扩展是实现
public extension PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }
    func willSend(_ request: RequestType, target: TargetType) {

    }
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {

    }
    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> { return result
    }
}

/// Request type used by `willSend` plugin function.
public protocol RequestType {

    // Note:
    //
    // We use this protocol instead of the Alamofire request to avoid leaking that abstraction.
    // A plugin should not know about Alamofire at all.

    /// Retrieve an `NSURLRequest` representation.
    var request: URLRequest? { get }

    /// Authenticates the request with a username and password.
    func authenticate(user: String, password: String, persistence: URLCredential.Persistence) -> Self

    /// Authenticates the request with an `NSURLCredential` instance.
    func authenticate(usingCredential credential: URLCredential) -> Self
}
