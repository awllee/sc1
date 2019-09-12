---
title: Welcome to the Tidyverse
---

<style>
body {
text-align: justify}
</style>

The purpose of this chapter is introducing you to the ["Tidyverse"](https://www.tidyverse.org/), which consists of a set of inter-compatible packages sharing the same programming philosophy. The Tidyverse is quite extended, so here we aim at highlighting the parts (concepts, packages and specific functions) that are highly likely to be useful to you (PhD students in Statistics). For a more in depth introduction, see the online book [R for Data Science](https://r4ds.had.co.nz).

Chapter 1 of [R for Data Science](https://r4ds.had.co.nz) details the programming philosophy underlying the Tidyverse. From a practical point of view, we could say that the Tidyverse is all about data frames. In particular, the Tidyverse provides tools for building and transforming data frames, to that they are in the right (tidy) format for visualization and modelling. The material provided here focusses on:

   - introducing pipes `%>%` and explaining their usefulness when programming in `R`.
   - building visualizations with the `ggplot2` package. We'll go through the basics of this package and we will show why the layer-based framework implemented by `ggplot2` is very useful when building a library of visual tools.
   - Manipulating and transforming data using the `dplyr`, `tidyr` and `purrr` packages, for the purpose of streamlining visualization and modelling.
   
Contents:
