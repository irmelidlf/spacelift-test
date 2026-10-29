# Example push policy for exercise 7. Paste into Spacelift (Policies → Create → Git push),
# attach it to the stack, then push and inspect the samples in the policy workbench.
# Verify field names against a real sample input - that's the point of the exercise.
package spacelift

import future.keywords.if
import future.keywords.in

# Tracked run: push to the stack's tracked branch that touches the project root.
track if {
	input.push.branch == input.stack.branch
	affected
}

# Proposed run: any other branch that touches the project root.
propose if {
	input.push.branch != input.stack.branch
	affected
}

# Ignore anything that doesn't touch the project root.
ignore if not affected

# Something to break on purpose: commit messages containing [skip] are ignored.
ignore if contains(input.push.message, "[skip]")

affected if {
	some file in input.push.affected_files
	startswith(file, input.stack.project_root)
}

# Record every evaluation so it shows up in the policy workbench.
sample := true
