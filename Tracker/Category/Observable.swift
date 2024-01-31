//
//  Observable.swift
//  Tracker
//
//  Created by Никита Гончаров on 30.01.2024.
//

@propertyWrapper
final class Observable<Value> {
    private (set) var onChange: ((Value) -> Void)? = nil
    
    var wrappedValue: Value {
        didSet {
            onChange?(wrappedValue)
        }
    }
    
    var projectedValue: Observable<Value> {
        return self
    }
    
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    func bind(action: @escaping (Value) -> Void) {
        self.onChange = action
    }
}
