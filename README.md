
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stopwatch

<!-- badges: start -->

<!-- badges: end -->

The goal of stopwatch is to make executing long running code a better
experience. Long running code can seriously hurt productivity, because
your concentration is often brokne when you are waiting for an
expression to finish evaluating. stopwatch will give you an idea of how
long

## Installation

stopwatch is not on CRAN. You can install stopwatch from GitHub with:

``` r
remotes::install_github('JamesM131/stopwatch')
```

## Example

Loading the stopwatch package will automatically override the default
variable assignment. The new assignment operator will start a timer in
the console that will count upwards while code is executing, and will
run `beepr::beep()` when the execution has finished if it took longer
than 3 seconds.

``` r
library(stopwatch)
```

A stopwatch timer can also be created directly, which is useful if the
long running code is not being assigned to a variable. This is done like
so:

``` r
start_timer()
stop_timer()
```

## Notes

  - The timer is slightly slower than my phone’s built in stopwatch on a
    crude measurement. I’m looking at adding a test for that and
    possibly a timing correction.
  - Ideally this package would override automatic printing along with
    assignment, but the implementation of that seems trickier.
  - If stopwatch’s modified assignment causes problems in your code, it
    can be removed by running `rm('<-')`
