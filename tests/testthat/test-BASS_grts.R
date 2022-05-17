test_that("Sampling works - no GRTS", {
  pp <- palmerpenguins::penguins |>
    mutate(across(.fns = as.character))
  names(pp) <- glue::glue("LC{1:ncol(pp)}")
  expect_equal(withr::with_seed({draw_random_samples(att.sf =  pp,
                                                    num_runs = 1, nsamples = 10, use_grts = F) |>
                                  purrr::pluck('random_sample')},seed = 15

                                ),
               withr::with_seed(15,
                                {
                                  slice_sample(pp, n= 10) |>
                                    mutate(run = 1)
                                  }))
})
