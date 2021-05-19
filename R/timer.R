#' Format centi-seconds for timer
#'
#' @param seconds
#'
#' @return
#'
#' @examples
seconds_to_timer <- function(cs) {
  minutes <- floor(cs / 60) %>%
    stringr::str_pad(2, pad = '0')
  seconds <- floor((cs %% 60)) %>%
    stringr::str_pad(2, pad = '0')
  glue::glue('{minutes}:{seconds}')
}


#' Internal Timer
#'
#' @return
#'
#' @examples
#' @export
timer <- function () {
  .id <<- .id + 1
  message('\r', seconds_to_timer(.id), appendLF = FALSE)
}

#' Start the timer
#'
#' @param initial
#' @param delay
#'
#' @return
#' @export
#'
#' @examples
start_timer <- function(initial = 0, delay = 0){
  if(delay != 0) {
    later::later(
      function(){
        .id <<- initial
        tcltk2::tclTaskSchedule(1000, timer(), id = "timer", redo = TRUE)
      },
      delay = delay
    )
  } else {
    .id <<- initial
    tcltk2::tclTaskSchedule(1000, timer(), id = "timer", redo = TRUE)
  }

}

#' Stop the timer
#'
#' @return
#' @export
#'
#' @examples
stop_timer <- function(){
  tcltk2::tclTaskDelete('timer')
}
