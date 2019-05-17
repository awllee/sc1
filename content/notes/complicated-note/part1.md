---
title: Part 1
---

This is part 1.

Let's try some math. As the source is a Markdown and not an RMarkdown file, one has to use special syntax to enable math rendering. Specifically, one can use

1. `\\( <LaTeX> \\)` and `\\[ <LaTeX> \\]`,
1. `` `$<LaTeX>$` `` and `` `$$<LaTeX>$$` ``,

for inline and display mode, respectively. In the former, one can use `\newline` or `\\\\\` instead of `\\` to break lines.

Let \\(x = 1\\) and

\\[
\begin{align}
z^2 &= x^2 + y^2 \\\\\
x &= 3 \newline
y &= 4.
\end{align}
\\]

Alternatively, let `$x = 1$` and

`$$
\begin{align}
z^2 &= x^2 + y^2 \\
x &= 3 \\
y &= 4.
\end{align}
$$`
