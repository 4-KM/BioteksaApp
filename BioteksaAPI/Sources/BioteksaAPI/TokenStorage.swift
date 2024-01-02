
import Combine
import Dependencies
import Foundation

/// Mockable version of users defaults for swiftui previews and unit tests.
public protocol UserDefaultStorage: Sendable {
    /// Retrieve a data object from unencrypted disk cache
    func data(forKey: some StorageKey) -> Data?
    /// Retrieve a value from unencrypted disk cache
    func value(forKey: some StorageKey) -> Any?
    /// Store a value in unencrypted disk cache
    func set(_: Any?, forKey: some StorageKey)
}

// The UserDefaults class is thread-safe.
// https://developer.apple.com/documentation/foundation/userdefaults
extension UserDefaults: UserDefaultStorage, @unchecked Sendable {
    public func data(forKey key: some StorageKey) -> Data? {
        return self.data(forKey: key.keyValue)
    }
    
    public func value(forKey key: some StorageKey) -> Any? {
        return self.value(forKey: key.keyValue)
    }
    
    public func set(_ value: Any?, forKey key: some StorageKey) {
        if let v = value,
           case Optional<Any>.none = v {
            self.removeObject(forKey: key.keyValue)
        } else {
            self.set(value, forKey: key.keyValue)
        }
    }
}

public final class MockUserDefaults: UserDefaultStorage {
    public let storage: (StorageKey) -> Any
    
    public init(storage: @escaping (StorageKey) -> Any) {
        self.storage = storage
    }
    
    public func data(forKey key: some StorageKey) -> Data? {
        storage(key) as? Data
    }
    
    public func value(forKey key: some StorageKey) -> Any? {
        storage(key)
    }
    
    public func set(_ value: Any?, forKey key: some StorageKey) {
        //storage(key) = value
    }
}

// MARK: DependencyKey

extension DependencyValues {
    private enum UserDefaultsKey: DependencyKey {
        static let liveValue: UserDefaultStorage = UserDefaults.standard
    }
    
    public var userDefaults: UserDefaultStorage {
        get { self[UserDefaultsKey.self] }
        set { self[UserDefaultsKey.self] = newValue }
    }
}


public protocol StorageKey {
    var rawValue: String { get }
    var keyValue: String { get }
    static var keyGroupName: String { get }
}

extension StorageKey {
    /// The key group name. It can be used for debugging/logging purposes.
    public var __keyGroupName: String {
        Self.keyGroupName
    }
    /// Full key name including the group it beleongs. It can be used for debugging/logging purposes.
    ///
    /// ```swift
    ///     enum Settings: String, StorageKey {
    ///     case lastUsedDate
    ///     ...
    ///     }
    /// ```
    /// In this example the `keyValue` for the `lastUsedDate` will be
    /// "`Settings.lastUsedDate`"
    ///
    /// The `keyValue` is used in a storage as a `key`. If you want for the key to follow different
    /// naming convention then please override keyValue in your implementation.
    public var keyValue: String {
        "\(__keyGroupName)_\(rawValue)"
    }
    /// The key group name used to make `keyValue`
    public static var keyGroupName: String {
        String(describing: self)
    }
}
