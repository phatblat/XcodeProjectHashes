// Xcode DerivedData Project Hashes
// "application hash"
// hashStringForPath() in DevToolsCore.framework
// https://pewpewthespells.com/blog/xcode_deriveddata_hashes.html

import Foundation
import Darwin
import CommonCrypto


// @param path (input) string path to the ".xcodeproj" or ".xcworkspace" file
let path = "/Users/phatblat/dev/ldg/L8r/L8r.xcodeproj"
//let path = "/Users/phatblat/dev/ldg/L8r/L8r.xcworkspace/contents.xcworkspacedata"

let url = URL(fileURLWithPath: path)
url.path
url.relativePath
FileManager.default.fileExists(atPath: url.path)

func md5(_ inString: String) -> String! {
    let str = inString.cString(using: .utf8)
    let strLen = CUnsignedInt(inString.lengthOfBytes(using: String.Encoding.utf8))
    let digestLen = Int(CC_MD5_DIGEST_LENGTH)
    let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
    CC_MD5(str!, strLen, result)
    let hash = NSMutableString()
    for i in 0..<digestLen {
        hash.appendFormat("%02x", result[i])
    }
    result.deallocate()
    return String(format: hash as String)
}

func swapByteOrder(value: UInt64) -> UInt64 {
    var val = value
    val = ((val << 8) & 0xFF00FF00FF00FF00 ) | ((val >> 8) & 0x00FF00FF00FF00FF )
    val = ((val << 16) & 0xFFFF0000FFFF0000 ) | ((val >> 16) & 0x0000FFFF0000FFFF )
    return (val << 32) | (val >> 32)
}

extension String {
   func splitStringInHalf() -> (firstHalf: String, secondHalf: String) {
        (firstHalf: String(prefix(count / 2)),
         secondHalf: String(suffix(count / 2)))
    }
}

let md = md5(url.relativePath)!
let digestLength = md.count
//assert(md.count == Int(CC_MD5_DIGEST_LENGTH))
let digest = md.splitStringInHalf()

let value = UInt64(digest.firstHalf, radix: 16)!
var startValue = swapByteOrder(value: value)
var resultStr = ""

// for indexes 13->0
for _ in 0..<14 {
    // take 'startValue' mod 26 (restrict to alphabetic) and add based 'a'
    let a = 97

    resultStr += String(UnicodeScalar(Int(startValue % 26) + a)!)

    // divide 'startValue' by 26
    startValue /= 26
}

resultStr = String(resultStr.reversed())

let value2 = UInt64(digest.secondHalf, radix: 16)!
var startValue2 = swapByteOrder(value: value2)
var resultStr2 = ""

UInt64.max
Int64.max
Int.max

// The second loop, this time using the last 8 bytes
// repeating the same process as before but over indexes 27->14
for _ in 0..<14 {
    // take 'startValue' mod 26 (restrict to alphabetic) and add based 'a'
    let a = 97

//    guard startValue2 < Int64.max else { fatalError("\(startValue2) > \(Int64.max)") }
    resultStr2 += String(UnicodeScalar((Int(startValue2 % 26)) + a)!)

    // divide 'startValue' by 26
    startValue2 /= 26
}

// Append 2nd string to first
resultStr += String(resultStr2.reversed())

// L8r-cpckiwyzoxkdryfqcmvqnwplhabs
// L8r-amzyuopsfehkeqblzbjumxvihnge

// xcproject: djlnzmvjghohdwghlaqbqnmbtvmm
// workspace: gfdlfjwezhaxvsfnwsknxibrnjoy
