# assign("<-", function(x, y) {
#   .Primitive("<-")(`<-`, .Primitive('<-'))
#   x_quo <- rlang::enquo(x)
#   y_quo <- rlang::enquo(y)
#
#   start <- Sys.time()
#   message('assigning')
#   later::later(start_timer(), delay = 3)
#   assign(rlang::quo_name(x_quo), y, envir = parent.frame())
#   end <- Sys.time()
#   diff <- as.numeric(end - start)
#   if(diff > 3) {
#     stop_timer()
#     beepr::beep()
#   }
# })

# print <- function(x, ...) {
#   message('printing')
#   start <- Sys.time()
#   UseMethod('print')
#   on.exit({
#     end <- Sys.time()
#     diff <- as.numeric(end - start)
#     message('exiting')
#     if(diff > 3) beepr::beep()
#   })
# }








