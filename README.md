
<!-- README.md is generated from README.Rmd. Please edit that file -->

# getnews

<!-- badges: start -->
<!-- badges: end -->

The goal of `{getnews}` is to obtain all the NEWS items that concern a
particular function. This can be used to know when a particular function
was introduced in a package.

## Installation

You can install the development version of `{getnews}` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etiennebacher/getnews")
```

## Example

``` r
library(getnews)

getnews("paste0")
#> VERSION 2.15.0 
#>  =========== 
#> 
#>  New function paste0(), an efficient version of paste(*,
#> sep=""), to be used in many places for more concise (and
#> slightly more efficient) code. 
#> 
#> 
#> VERSION 4.0.1 
#>  =========== 
#> 
#>  paste() and paste0() gain a new optional argument recycle0.
#> When set to true, zero-length arguments are recycled leading to
#> character(0) after the sep-concatenation, i.e., to the empty
#> string "" if collapse is a string and to the zero-length value
#> character(0) when collapse = NULL.
#> 
#> A package whose code uses this should depend on R (>= 4.0.1).

getnews("relocate", "dplyr")
#> VERSION 1.0.0 
#>  =========== 
#>  New relocate() verb makes it easy to move columns around within a
#>     data frame (#4598).
#> 
#>   
#> 
#> VERSION 1.0.3 
#>  =========== 
#>  relocate() can rename columns it relocates (#5569).
#> 
#> 

getnews("testServer", "shiny", recent_first = FALSE)
#> VERSION 1.6.0 
#>  =========== 
#>  testServer() can accept a single server function as input (#2965).
#> 
#>   
#> 
#> VERSION 1.5.0 
#>  =========== 
#>  testServer() is a new function for testing reactive behavior inside
#>     server functions and modules. (#2682, #2764, #2807)
#> 
#> 
```
