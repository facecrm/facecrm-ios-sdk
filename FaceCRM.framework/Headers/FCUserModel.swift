import UIKit

@objc public class FCUserModel:NSObject{
    @objc public var faceId:String = ""
    @objc public var metaData:Array<String> = []
    @objc public var age:Int = 0
    @objc public var emotion:String = ""
    @objc public var gender:String = ""
    @objc public var fullData:Dictionary<String,Any> = [:]
}
