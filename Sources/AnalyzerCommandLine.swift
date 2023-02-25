import Foundation
import ArgumentParser

@main
struct AnalyzerCommandLine: ParsableCommand {
	@Option(name: .shortAndLong, help: "Pattern to find")
	var pattern: String = ""
	
	@Argument(help: "Files path to analyzer")
	var filesPath: [String] = []
	
	mutating func run() throws {
		
	}
}
