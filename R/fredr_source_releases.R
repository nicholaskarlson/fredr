#' Get the releases for a source
#'
#' @param source_id An integer ID for the data source.
#'
#' @param limit An integer limit on the maximum number of results to return.
#' Defaults to `1000`, the maximum.
#'
#' @param offset An integer used in conjunction with limit for long series.
#' This mimics the idea of _pagination_ to retrieve large amounts of data over
#' multiple calls. Defaults to `0`.
#'
#' @param order_by A string indicating which attribute should be used to order
#' the results.  Possible values:
#'
#' * `"release_id"` (default)
#' * `"name"`
#' * `"press_release"`
#' * `"realtime_start"`
#' * `"realtime_end"`
#'
#' @param sort_order A string representing the order of the resulting series.
#' Possible values are: `"asc"` (default), and `"desc"`.
#'
#' @param realtime_start A `Date` indicating the start of the real-time period.
#' Defaults to today's date. For more information, see
#' [Real-Time Periods](https://fred.stlouisfed.org/docs/api/fred/realtime_period.html).
#'
#' @param realtime_end A `Date` indicating the end of the real-time period.
#' Defaults to today's date. For more information, see
#' [Real-Time Periods](https://fred.stlouisfed.org/docs/api/fred/realtime_period.html).
#'
#' @param ... These dots only exist for future extensions and should be empty.
#'
#' @return A `tibble` object.
#'
#' @section API Documentation:
#'
#' [fred/source/releases](https://fred.stlouisfed.org/docs/api/fred/source_releases.html)
#'
#' @seealso [fredr_sources()], [fredr_source()]
#'
#' @examples
#' if (fredr_has_key()) {
#' # Board of Governors
#' fredr_source_releases(source_id = 1L)
#'
#' # University of Michigan
#' fredr_source_releases(source_id = 14L, realtime_start = as.Date("1950-01-01"))
#' }
#' @export
fredr_source_releases <- function(source_id,
                                  ...,
                                  limit = NULL,
                                  offset = NULL,
                                  order_by = NULL,
                                  sort_order = NULL,
                                  realtime_start = NULL,
                                  realtime_end = NULL) {
  check_dots_empty(...)
  check_not_null(source_id, "source_id")

  user_args <- capture_args(
    realtime_start = realtime_start,
    realtime_end = realtime_end,
    source_id = source_id,
    limit = limit,
    offset = offset,
    order_by = order_by,
    sort_order = sort_order
  )

  fredr_args <- list(
    endpoint = "source/releases"
  )

  do.call(fredr_request, c(fredr_args, user_args))
}
