.onLoad <- function(libname, pkgname){
  # message('loading')
  assign("<-", function(x, y) {
    .Primitive("<-")(`<-`, .Primitive('<-'))
    x_quo <- rlang::enquo(x)
    y_quo <- rlang::enquo(y)

    start <- Sys.time()
    start_timer()
    assign(rlang::quo_name(x_quo), y, envir = parent.frame())
    end <- Sys.time()
    diff <- as.numeric(end - start)
    stop_timer()
    if(diff > 3)
      beepr::beep()
  }, envir = globalenv())
}
