#' Check password_hash_table
#'
#' @param x
#'
#' @description Checks if x is in password_hash_table$alnum
#' and returns the encrypted value if it finds it, else it
#' returns x
#'
#' @return
#' @export
#'
#' @examples
check <- function(x){
  ifelse(
    x %in% password_hash_table$alnum,
    password_hash_table[password_hash_table$alnum == x, "encrypt"],
    x
  )
}

#' Encrypt
#'
#' @param ...
#'
#' @description Takes in a character vector and returns an
#' encrypted string based on the password_hash_table
#' available in package
#'
#' @importFrom purrr flatten_chr map %>%
#' @importFrom stringr str_extract_all
#'
#' @return
#' @export
#'
#' @examples
encrypt <- function(...){
  # split the param passed into a list of individual characters
  str_extract_all(..., ".") %>%
    # coerce list to a character vector
    flatten_chr() %>%
    # apply check to every element of character vector and return list of each character encryted
    map(check) %>%
    # coerce list to a character vector
    flatten_chr() %>%
    # join all encrypted values
    paste(collapse = "")

}
