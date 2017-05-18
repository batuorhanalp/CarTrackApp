//
//  RealmExtension.swift
//  CarTrackApp
//
//  Created by Batu Orhanalp on 17/05/2017.
//  Copyright © 2017 Batu Orhanalp. All rights reserved.
//

import RealmSwift

protocol DataSource {
    
    associatedtype T: Object
    
    static func get() -> [T]
    static func get(id: Any) -> T?
}

extension Realm {
    
    /* 
     * Performs actions contained within the given block inside a write transaction with completion block.
     *
     * - parameter block: write transaction block
     * - completion: completion executed after transaction block
     */
    func write(transactionBlock block: (Void) -> (), completion: (Void) -> ()) throws {
        do {
            try write(block)
            completion()
        } catch {
            throw error
        }
    }
}

extension Object {
    
    /*
     * Saves object both async or sync
     * This method can also used by background threads 
     * If the current thread is not main thread carries the process to main thread for only saving.
     *
     * This method also checks for the object. If the object saved before it will be updated.
     * Returns only primary key.
     */
    func save<T: Object>(type: T.Type) -> Any? {
        
        if Thread.isMainThread {
            return self.saveOnMainThread(type: type)
        } else {
            var primaryKey: Any?
            let group = DispatchGroup()
            group.enter()
            
            DispatchQueue.main.async {
                if let result = self.saveOnMainThread(type: type) {
                    primaryKey = result.value(forKeyPath: (self.objectSchema.properties.first?.name)!)
                } else {
                    primaryKey = nil
                }
                
                group.leave()
            }
            
            group.wait()
            
            if primaryKey == nil {
                return nil
            }
            
            return primaryKey
        }
    }
    
    /*
     * This saving method can only used on main thread
     * Saving process can only be in the main thread
     */
    func saveOnMainThread<T: Object>(type: T.Type) -> T? {
        if Thread.isMainThread {
            var db = self.realm
            if db == nil {
                do {
                    db = try Realm(configuration: Realm.Configuration.defaultConfiguration)
                } catch let error {
                    print("Realm initialization has failed. Error: \(error)")
                    return nil
                }
            }
            
            if let realmDb = db {
                do {
                    print("Thread.isMainThred = \(Thread.isMainThread)\nThis thread is \(Thread.current)")
                    let primaryKey = self.value(forKeyPath: (self.objectSchema.properties.first?.name)!)
                    if realmDb.object(ofType: type, forPrimaryKey: primaryKey) != nil {
                        try realmDb.write {
                            realmDb.add(self, update: true)
                        }
                    } else {
                        try realmDb.write {
                            realmDb.add(self)
                        }
                    }
                } catch {
                    return nil
                }
                return (self as! T)
            }
            return nil
        }
        return nil
    }
}

extension Results {
    /*
     * Converts Realm results into Array
     */
    func toArray<T>(type: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}

struct DatabaseMethods {
    /*
     * Clears all Realm database
     */
    static func clearDatabase(completion: @escaping() -> ()) {
        let realm = try! Realm()
        try! realm.write(
            transactionBlock: {
                realm.deleteAll()
        },
            completion: {
                completion()
        })
    }
}
