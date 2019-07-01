# Task 1
library(tidyverse)
mpg %>% tbl_df()
ggplot(data = mpg, aes(x = displ, y = hwy, color = trans)) +
  geom_point(color = "red") +
  geom_smooth()

# Task 2
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "red") +
  geom_smooth()

# Task 3
ggplot(data = mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = FALSE)

# Task 4
ggplot(data = mpg, aes(x = displ, y = hwy, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Task 5
ggplot(mpg, aes(x = displ, y = hwy, colour = factor(cyl))) +
  geom_point() +
  scale_x_log10(breaks = c(2, 3, 4, 5, 6, 7)) +
  scale_y_log10(breaks = c(20, 30, 40)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    x = "Engine Size Displacement (litres)",
    y = "Highway miles per gallon",
    colour = "Cylinders",
    title = "Fuel Economy and Engine Size"
  ) +
  facet_wrap(~year, labeller = as_labeller(c(
    "1999" = "Model Year 1999",
    "2008" = "Model Year 2008"
  )))

# Task 6
data(mpg, package = "ggplot2")
mpg %>% tbl_df
mpg2 <- mpg %>% select(manufacturer, model, displ, year, cyl, trans, cty, hwy)

# Task 7
mpg3 <- mpg2 %>% mutate(displ2 = displ^2, 
                        vol_per_cyl = round(displ / cyl, 2))

# Task 8
mpg3 %>% arrange(desc(vol_per_cyl))
mpg3 %>% filter(manufacturer == "chevrolet") %>% 
  arrange(desc(vol_per_cyl))
mpg4 <- mpg3 %>% 
  group_by(manufacturer, year) %>% 
  summarise(max_vol_per_cyl = max(vol_per_cyl))

# Task 9
mpg5 <- mpg4 %>% spread(year, max_vol_per_cyl)

# Task 10
mpg6 <- mpg5 %>% mutate(change = `2008` - `1999`)

# Task 11
mpg6 %>% 
  rename(max_vpc_1999 = `1999`, max_vpc_2008 = `2008`) %>% 
  gather(variable, value) %>% View

