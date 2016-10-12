#' Save headlines as file
#'
#' Write headlines to file.
#'
#' @param folder Which folder to write the files. Defaults to working directory.
#' @param csv_for_data_collector Whether to write .csv-files (which we sendt to our data collector).
#' @param rdata_for_package Whether to write the .RData-file we included in this compendium (\code{data("headlines")}).
#' @keywords headlines prepublication
#'
#' @importFrom utils write.csv
#'
#' @examples
#'\dontrun{
#'  headlines_save()
#' }
#' @export
headlines_save <- function(folder = getwd(),
                           csv_for_data_collector = TRUE,
                           rdata_for_package = TRUE) {

  headlines_hard <- headlines("hard")
  headlines_hard_small <- headlines_hard[, c("id", "headline")]
  headlines_soft <- headlines("soft")
  headlines_soft_small <- headlines_soft[, c("id", "headline")]

  if (csv_for_data_collector) {
    write.csv(headlines_hard_small, file = paste0(folder, "/overskrifter_politikk.csv"), row.names = FALSE)
    write.csv(headlines_soft_small, file = paste0(folder, "/overskrifter_underholdning.csv", row.names = FALSE))
  }

  if (rdata_for_package) {
    save(headlines_hard, headlines_hard_small,
         headlines_soft, headlines_soft_small,
         file = paste0(folder, "/headlines.RData"))
  }

  invisible(NULL)
}