# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About this project

`gren-diff` is a [Gren](https://gren-lang.org/) package that computes unified diffs between two strings. It exposes two public functions: `UnifiedDiff.unifiedDiffStrings` (splits strings on newlines then diffs) and `UnifiedDiff.unifiedDiffStringsArrays` (diffs pre-split `Array String` values directly). Both use an LCS (longest common subsequence) dynamic-programming algorithm.

## Commands

Run tests from the `tests/` directory:

```sh
cd tests
./run-tests.sh
```

This compiles the test application with `gren make Main --output=app` and runs it with `node app`.

## Architecture

All library code lives in `src/UnifiedDiff.gren`. The algorithm proceeds in five steps, each implemented as a separate section:

1. **`buildLcsTable`** — builds an `(m+1)×(n+1)` DP table stored as a flat row-major `Array Int`.
2. **`computeEdits`** — backtracks the table to produce an `Array Edit` (`Keep`, `Remove`, `Add`). Backtracking is iterative (tail-recursive accumulator) to avoid stack overflows.
3. **`annotateEdits`** — attaches 1-based old/new line numbers to each edit, yielding `Array LineEdit`.
4. **`extractHunks`** — groups nearby changes into `Hunk` values, each padded with `contextSize` (3) context lines. Overlapping windows are merged by `groupRanges`.
5. **`renderHunk`** — formats each hunk as the standard `@@ -a,b +c,d @@\n...` string.

The test suite is a separate Gren application in `tests/` that depends on this package via `"local:../"`. Tests are in `tests/src/UnifiedTests.gren` and the entry point is `tests/src/Main.gren`.
