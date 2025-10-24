data("mtcars")
head(mtcars)
library(lattice)

# Conditional scatter plot (small multiples)
xyplot(mpg ~ wt | factor(cyl),
       data = mtcars,
       main = "Lattice: MPG vs. Weight by Cylinders")

# Box-and-whisker plot
bwplot(mpg ~ factor(gear),
       data = mtcars,
       main = "Lattice: MPG by Gear")
library(ggplot2)

# Scatter plot with smoothing
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "ggplot2: MPG vs. Weight with trend by Cylinder")

# Faceted histogram
ggplot(mtcars, aes(mpg)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ gear) +
  labs(title = "ggplot2: MPG distribution by Gear")

