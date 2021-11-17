test_that("histogram returns a ggplot object",{
  p <- histogram(gapminder::gapminder, lifeExp)
  expect_s3_class(p, "ggplot")
})

test_that("histogram throws an error when using a x that is not numeric", {
  expect_error(histogram(gapminder::gapminder, country), "This function only works for numeric input!
you have provided an object of class:factor")
})

test_that("the second layer is a geom_vline", {
  expect_true(
    "GeomVline" %in% class(histogram(gapminder::gapminder, lifeExp)$layers[[2]]$geom))
})
