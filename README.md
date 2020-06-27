
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dataui

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/dataui)](https://CRAN.R-project.org/package=dataui)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

`dataui` brings the beautiful interactive visualizations of
[`data-ui`](https://williaster.github.io/data-ui) based on
[`vx`](https://vx-demo.now.sh/) to **R**. Currently the package nearly
fully supports
[`sparkline`](https://williaster.github.io/data-ui/?selectedKind=sparkline&selectedStory=Kitchen%20sink&full=0&addons=0&stories=1&panelRight=0)
and
[`histogram`](https://williaster.github.io/data-ui/?selectedKind=histogram&selectedStory=Playground&full=0&addons=0&stories=1&panelRight=0),
and no you do **not** need to know `React`. You will be writing `React`
without even knowing it.

Yes, I know `data-ui` is in [repo
freeze](https://github.com/williaster/data-ui#repo-freeze-), but I could
not wait for [\#201](https://github.com/williaster/data-ui/issues/201).
The author, now also on the `vx` team, has done an incredible job, so I
am willing (slightly crazy) to invest the time to write this package.
Plus, I sort of “need” it for a live project.

## Help

I would love for you to join me on the journey, and I will make sure
that this is a friendly and welcoming place. If money is more abundant
than time for you, then let me know as well.

## Installation

Far from CRAN-worthy but hopefully there eventually,
`remotes::install_github()` for now.

``` r
remotes::install_github("timelyportfolio/dataui")
```

## Example

I was able to nearly fully replicate all the `data-ui` sparkline
examples. See the [vignette]().

## Code of Conduct

Please note that the ‘dataui’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
