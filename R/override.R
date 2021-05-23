#' Transform a function to use a stopwatch when it runs
#'
#' @param fn
#'
#' @return
#' @export
#'
#' @examples
stopwatch <- function(fn){
  # I need to define a new function here that we will then return. this function starts
  # the timer, has a call to the original function
  .fn <- function(...){
    start_timer()
    start <- Sys.time()
    ret <- fn(...)
    stop_timer()
    end <- Sys.time()
    diff <- as.numeric(end - start)

    if(diff > 3)
      beepr::beep()

    return(ret)
  }
  return(.fn)
}
