# gren-diff

This package provides code to produce a diff between two sets of strings, where
each string is a line of text. Currently the
only supported output format is a "unified diff".


# UnifiedDiff

## unifiedDiffStrings

This function accepts two strings which are treated as "documents" with
newlines in them. It splits the strings on the newlines, and diffs the resulting arrays of strings.
It compares them line by line and returns a standard
[unified diff](https://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html).
If the inputs are identical, an empty string is returned.

```gren
UnifiedDiff.unifiedDiffStrings original modified
```

## unifiedDiffArrays

This function accepts to arrays of strings, where each string is a line of
text.

It compares them line by line and returns a standard
[unified diff](https://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html).
If the inputs are identical, an empty string is returned.

```gren
UnifiedDiff.unifiedDiffArrays originalLines modifiedLines
```

## Output format

The output of both unifiedDiffStrings and unifiedDiffArrays
follows the conventional unified diff format with three lines
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

# Using this with gren-lang/test's Expect

If you're comparing two multi-line strings in a unit test, UnifiedDiff is a
great way to see the difference between two strings that are not equal.
The test will look like this:

```gren
import Expect
import UnifiedDiff exposing (unifiedDiffStrings)

    test "This is a test" <| \_ ->
        (Expect.equal expectedString resultString
                |> Expect.onFail (unifiedDiffStrings expectedString resultString) )
```

# Credits

The code was co-authored by Claude AI.
