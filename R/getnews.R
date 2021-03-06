#' Get all the NEWS entries that concern a particular function
#'
#' @param fn Function to search
#' @param pkg In which package is the function? Default is `NULL`, which searches
#' in base R.
#' @param recent_first Display the most recent version at the bottom of the
#' console? Default is `TRUE`.
#'
#' @return Prints text
#' @export
#'
#' @examples
#' getnews('list2DF')
#' getnews("paste0")
#' getnews("sprintf")
#' getnews("relocate", "dplyr", recent_first = TRUE)

getnews <- function(fn, pkg = NULL, recent_first = TRUE) {

  fn <- gsub("\\.", "\\\\.", fn)

  if (is.null(pkg)) {

    ## Need to put this dataset in an external dataset to avoid loading time
    ## This only get news for 4.0.0, see the doc for 3.0 and 2.0
    db <- Rnews
    txt <- db[, c("Version", "Text")]
    txt <- txt[grepl(fn, txt$Text), ]
    if (recent_first) {
      txt <- txt[match(versionsort::ver_sort(txt$Version), txt$Version), ]
    } else {
      txt <- txt[match(rev(versionsort::ver_sort(txt$Version)), txt$Version), ]
    }


    txt_split <- split(txt, txt$Version)
    for (i in seq_along(txt_split)) {
      cat(
        "VERSION", unique(txt_split[[i]]$Version), "\n",
        "===========", "\n\n",
        paste(txt_split[[i]]$Text, collapse = "\n"), "\n\n\n"
      )
    }


  } else {

    db <- as.data.frame(utils::news(package = pkg))
    txt <- db[, c("Version", "Text")]
    txt <- txt[grepl(fn, txt$Text), ]

    txt_split <- split(txt, txt$Version)
    txt_split <- lapply(txt_split, function(x) {
      to_keep <- strsplit(x$Text, " - ")[[1]]
      to_keep <- to_keep[grepl(fn, to_keep)]
      x$Text <- paste0(to_keep, collapse = "")
      unique(x)
    })

    order_to_use <- if (recent_first) {
      versionsort::ver_sort(names(txt_split))
    } else {
      rev(versionsort::ver_sort(names(txt_split)))
    }

    for (i in order_to_use) {
      cat(
        "VERSION", unique(txt_split[[i]]$Version), "\n",
        "===========", "\n",
        paste(txt_split[[i]]$Text, collapse = "\n"), "\n\n"
      )
    }

  }

}


