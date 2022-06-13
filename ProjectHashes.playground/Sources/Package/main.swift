do {
    if let path = CommandLine.arguments.first(where: { $0.contains("xcodeproj") || $0.contains("xcworkspace") }) {
        let hash = try XcodeHashes.hashStringFor(path: path)
        print("Generated hash: \(hash)")
    } else {
        print("No such path: \(CommandLine.arguments)")
    }
} catch let error {
    print("Error: \(error.localizedDescription)")
}
