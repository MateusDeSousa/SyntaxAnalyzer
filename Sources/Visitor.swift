import SwiftSyntax

final public class Visitor: SyntaxVisitor {
	var desiredProtocol: String
	var conformances: [String] = []
	
	init(desiredProtocol: String, conformances: [String]) {
		self.desiredProtocol = desiredProtocol
		super.init(viewMode: .all)
	}
	
	public override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
		process(identifier: node.identifier, inheritances: node.inheritanceClause)
		return .skipChildren
	}
	
	private func process(identifier: TokenSyntax, inheritances: TypeInheritanceClauseSyntax?) {
		
	}
}
