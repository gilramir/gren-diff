# gren-diff

This package provides code to produce a diff between two strings. Currently the
only supported output format is a "unified diff".


# UnifiedDiff

A single function, `unifiedDiff`, that compares two strings line by line and returns a standard
[unified diff](https://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html).
If the inputs are identical, an empty string is returned.

```gren
UnifiedDiff.unifiedDiff original modified
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

# Credits

The code was originally written by Claude AI.
