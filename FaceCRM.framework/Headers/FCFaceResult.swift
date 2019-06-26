import UIKit

@objc public class FCFaceResult:NSObject {
    @objc public var image:UIImage = UIImage()
    @objc public var model:FCUserModel = FCUserModel()
    @objc public var isSuccess:Bool = false
    @objc public var status:Int = -1
    @objc public var message:String = ""
}
