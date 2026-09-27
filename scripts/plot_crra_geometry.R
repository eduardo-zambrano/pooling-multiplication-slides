paper <- "#fbfaf7"
navy <- "#17324d"
teal <- "#1d6f8a"
rust <- "#a34b2a"
gold <- "#c28b27"
muted <- "#66737e"

open_plot <- function(path) {
  png(path, width = 760, height = 760, res = 130, bg = paper)
  par(
    bg = paper,
    fg = navy,
    col.axis = navy,
    col.lab = navy,
    family = "sans",
    mar = c(4.2, 4.4, 1.0, 0.7),
    mgp = c(2.5, 0.7, 0),
    tcl = -0.25
  )
}

draw_axes <- function(xlim, ylim, ticks, tick_labels = ticks) {
  plot(
    NA,
    xlim = xlim,
    ylim = ylim,
    xaxs = "i",
    yaxs = "i",
    asp = 1,
    axes = FALSE,
    xlab = "State 1 wealth",
    ylab = "State 2 wealth"
  )
  axis(1, at = ticks, labels = tick_labels, las = 1)
  axis(2, at = ticks, labels = tick_labels, las = 1)
  abline(h = 0, v = 0, col = muted, lwd = 1.2)
}

open_plot("assets/crra-generic.png")
plot(
  NA,
  xlim = c(0, 4.15),
  ylim = c(0, 4.15),
  xaxs = "i",
  yaxs = "i",
  asp = 1,
  axes = FALSE,
  xlab = "State 1 wealth",
  ylab = "State 2 wealth",
  cex.lab = 1.6
)
axis(1, at = 0:4, labels = FALSE)
axis(2, at = 0:4, labels = FALSE)
abline(h = 0, v = 0, col = muted, lwd = 1.2)
abline(a = 0, b = 1, col = gold, lwd = 2.2, lty = 2)
x <- seq(0.28, 4.15, length.out = 1000)
for (level in c(1.15, 2.05)) {
  y <- level^2 / x
  keep <- y <= 4.15
  lines(x[keep], y[keep], col = teal, lwd = 3.5)
}
dev.off()

open_plot("assets/crra-less-than-log.png")
draw_axes(c(0, 4.15), c(0, 4.15), 0:4)
x <- seq(0, 4, length.out = 800)
y <- (2 - sqrt(x))^2
lines(x, y, col = teal, lwd = 4)
points(1, 1, pch = 19, col = navy, cex = 1.35)
points(c(0, 4), c(4, 0), pch = 19, col = rust, cex = 1.35)
text(1.08, 1.14, "(1, 1)", col = navy, pos = 4, cex = 1.05)
text(3.94, 0.24, "K = 4", col = rust, pos = 2, cex = 1.08)
text(0.15, 3.88, "K = 4", col = rust, pos = 4, cex = 1.08)
text(2.65, 1.95, expression(gamma == 1/2), col = teal, cex = 1.15)
dev.off()

open_plot("assets/crra-log.png")
draw_axes(c(0, 4.15), c(0, 4.15), 0:4)
x <- seq(0.245, 4.15, length.out = 1000)
y <- 1 / x
lines(x[y <= 4.15], y[y <= 4.15], col = teal, lwd = 4)
points(1, 1, pch = 19, col = navy, cex = 1.35)
text(1.08, 1.14, "(1, 1)", col = navy, pos = 4, cex = 1.05)
text(0.34, 3.72, "approaches axis", col = rust, pos = 4, cex = 0.95)
text(3.72, 0.12, "approaches axis", col = rust, pos = 2, cex = 0.95)
dev.off()

open_plot("assets/crra-more-than-log.png")
draw_axes(
  c(0, 4.15),
  c(0, 4.15),
  c(0, 0.5, 1:4),
  expression(0, 1/2, 1, 2, 3, 4)
)
abline(h = 0.5, v = 0.5, col = gold, lwd = 2.4, lty = 2)
x <- seq(0.505, 4.15, length.out = 1000)
y <- x / (2 * x - 1)
lines(x[y <= 4.15], y[y <= 4.15], col = teal, lwd = 4)
points(1, 1, pch = 19, col = navy, cex = 1.35)
text(1.08, 1.14, "(1, 1)", col = navy, pos = 4, cex = 1.05)
text(2.75, 1.18, expression(gamma == 2), col = teal, cex = 1.15)
text(3.95, 0.24, "k = 1/2", col = gold, pos = 2, cex = 1.05)
text(0.58, 3.75, "k = 1/2", col = gold, pos = 4, cex = 1.05)
dev.off()
