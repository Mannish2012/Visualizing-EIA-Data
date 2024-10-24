
# conversion of scenario to symbol
purrr::map2(labels_trans, names_trans, ~paste(.x, ":", .y)) %>% unlist()

conversion_df <- tibble(labels = labels_trans,
                        scenario = names_trans)
conversion_func <- function(.names) filter(conversion_df, scenario == .names)
# conversion_func("high cost")


# sector by scenario (here, symbols)
d <- lapply(`all data`, function(x) {
  do.call(rbind,lapply(unique(x$scenario), conversion_func)) %>%
    pull(labels)
})


##################################################################


`all scenarios`$`transportation sector` -> names_trans
letters[1:length(names_trans)] -> labels_trans

