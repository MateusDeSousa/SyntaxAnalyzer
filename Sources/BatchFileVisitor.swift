import Foundation
import SwiftSyntax
import SwiftSyntaxParser

public struct GenericAsyncFileVisitorParser<Parser: SyntaxVisitor, T> {
	func values(from files: [String], parser: @escaping () -> Parser, transformation: @escaping (Parser) -> T) async -> [T] {
		var results: [T] = []
		
		await withTaskGroup(of: T?.self, body: { group in
			for source in files {
				group.addTask {
					do {
						let visitor = GenericAsyncFileVisitorParser<Parser, T>()
						let value = try await visitor.values(from: source, parser: parser(), transformation: transformation)
						return value
					} catch {
						print("Unable to parse declarations for file: \(source)")
						return nil
					}
				}
			}
			for await value in group {
				if let value = value {
					results.append(value)
				}
			}
		})
		return results
	}
	
	func values(from source: String, parser: Parser, transformation: (Parser) -> T) async throws -> T {
		return try await withCheckedThrowingContinuation({ continuation in
			do {
				let fileSyntax = try SyntaxParser.parse(URL(fileURLWithPath: source))
				parser.walk(fileSyntax)
				continuation.resume(with: .success(transformation(parser)))
			} catch {
				continuation.resume(throwing: error)
			}
		})
	}
}
