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

# Using this with Test.Expect

If you're comparing two multi-line strings in a unit test, UnifiedDiff is a
great way to see the difference between two strings that are not equal.
The test will look like this:

```gren
import Expect
import UnifiedDiff exposing (unifiedDiff)

    test testDescription <| \_ ->
        (Expect.equal expectedString resultString
                |> Expect.onFail (unifiedDiff expectedString resultString) )
```

# Credits

The code was originally written by Claude AI.
