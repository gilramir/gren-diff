# gren-diff

This package provides code to produce a diff between two strings. Currently the
only supported output format is a "unified diff".

The code was originally written by Claude AI.

# UnifiedDiff

A single function, `unifiedDiff`, that compares two strings line by line and returns a standard
[unified diff](https://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html).
If the inputs are identical, an empty string is returned.

```gren
Diff.unifiedDiff original modified
```

## Output format

The output follows the conventional unified diff format with three lines
of context around each change group:

```
@@ -1,5 +1,5 @@
 one
 two
-three
+THREE
 four
 five
```

## Algorithm

Diffs are computed using the classic dynamic-programming LCS (longest common subsequence) approach:

1. Build an `(m+1) × (n+1)` DP table over the two line arrays.
2. Backtrack through the table to produce a sequence of `Keep`, `Remove`,
and `Add` edits. The backtracking is iterative (tail-recursive with an
accumulator) to avoid stack overflows on large files.
3. Group nearby changes into hunks, each padded with up to three lines
of context. Change groups whose context windows overlap are merged into
a single hunk.
4. Render each hunk with a `@@ -a,b +c,d @@` header.

Time complexity is O(mn) in the size of the two inputs; space complexity is the same for the DP table.

## Limitations

The DP table itself allocates O(mn) memory, so comparing very large
files (thousands of lines each) will be slow. For most source files and
configuration files encountered in practice this is not an issue.
