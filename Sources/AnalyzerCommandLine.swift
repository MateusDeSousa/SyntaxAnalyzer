import Foundation
import ArgumentParser

@main
class AnalyzerCommandLine: ParsableCommand {
	@Option(name: .shortAndLong, help: "Pattern to find")
	var pattern: String = ""
	
	@Argument(help: "Files path to analyzer")
	var filesPath: [String] = []
	
	required init() {}
	
	func run() throws {
		print(filesPath)
		print(pattern)
//		let parser = GenericAsyncFileVisitorParser<Visitor, String>()
//		Task {
//			await parser.values(from: self.filesPath) {
//				Visitor(desiredProtocol: self.pattern, conformances: [])
//			} transformation: { visitor in
//				""
//			}
//		}
	}
}
