//import XcodeProjectHashes

// @param path (input) string path to the ".xcodeproj" or ".xcworkspace" file
let path = "/Users/phatblat/dev/ldg/L8r/L8r.xcodeproj"
//let path = "/Users/phatblat/dev/ldg/L8r/L8r.xcworkspace/contents.xcworkspacedata"

let hash = try XcodeHashes.hashStringFor(path: path)

// L8r-cpckiwyzoxkdryfqcmvqnwplhabs
// L8r-amzyuopsfehkeqblzbjumxvihnge

// xcproject: djlnzmvjghohdwghlaqbqnmbtvmm
// workspace: gfdlfjwezhaxvsfnwsknxibrnjoy
