paper <- "#fbfaf7"
navy <- "#17324d"
teal <- "#1d6f8a"
rust <- "#a34b2a"
gold <- "#c28b27"
muted <- "#66737e"

png(
  "assets/star-row-geometry.png",
  width = 800,
  height = 800,
  res = 130,
  bg = paper
)

par(
  bg = paper,
  fg = navy,
  col.axis = navy,
  col.lab = navy,
  family = "Arial Unicode MS",
  mar = c(4.4, 4.4, 0.8, 0.6),
  mgp = c(2.45, 0.7, 0),
  tcl = -0.25
)

plot(
  NA,
  xlim = c(0, 12),
  ylim = c(0, 12),
  xaxs = "i",
  yaxs = "i",
  asp = 1,
  axes = FALSE,
  xlab = "",
  ylab = ""
)

segments(0, 0, 12, 0, col = navy, lwd = 1, xpd = NA)
axis(
  1,
  at = 4,
  labels = "a = 4",
  las = 1
)
axis(2, at = seq(0, 12, by = 4), labels = FALSE)
mtext("x", side = 1, at = 12, line = 2.2)
mtext("y", side = 2, at = 12, line = 2.2, las = 1)

x <- seq(25 / 11.95, 12, length.out = 1000)
y <- 25 / x
lines(x, y, col = teal, lwd = 4)
text(7.6, 4.35, "x ⋆ y = N", col = teal, cex = 1.1)

abline(v = 4, col = gold, lwd = 2.4, lty = 2)
points(rep(4, 6), 1:6, pch = 19, col = rust, cex = 1.15)

dev.off()
