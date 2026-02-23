# Load ggplot2 globally so you don't always have to load it in every file
library(ggplot2)

#' Light Theme matching flatly-custom.scss
#' Text: #2c3e50 | Grid: #eeeeee
themel <- function(base_size = 11, base_family = "") {
    theme_minimal(base_size = base_size, base_family = base_family) +
        theme(
            text = element_text(color = "#2c3e50"),
            axis.text = element_text(color = "#2c3e50"),
            axis.title = element_text(color = "#2c3e50"),
            plot.title = element_text(color = "#2c3e50", face = "bold"),
            plot.subtitle = element_text(color = "#2c3e50"),
            plot.caption = element_text(color = "#7f8c8d"),

            # Grid lines matching the navbar border
            panel.grid.major = element_line(color = "#eeeeee", linewidth = 0.5),
            panel.grid.minor = element_line(color = "#f7f9fa", linewidth = 0.25),

            # Transparent backgrounds to let the Quarto site background show through
            plot.background = element_rect(fill = "transparent", color = NA),
            panel.background = element_rect(fill = "transparent", color = NA),
            legend.background = element_rect(fill = "transparent", color = NA),
            legend.key = element_rect(fill = "transparent", color = NA),
            legend.text = element_text(color = "#2c3e50"),
            legend.title = element_text(color = "#2c3e50")
        )
}

#' Dark Theme matching darkly-custom.scss
#' Text: #dee2e6 | Axis text: #adb5bd | Grid: #404146
themed <- function(base_size = 11, base_family = "") {
    theme_minimal(base_size = base_size, base_family = base_family) +
        theme(
            text = element_text(color = "#dee2e6"),
            axis.text = element_text(color = "#adb5bd"), # Slightly muted like blockquotes
            axis.title = element_text(color = "#dee2e6"),
            plot.title = element_text(color = "#dee2e6", face = "bold"),
            plot.subtitle = element_text(color = "#dee2e6"),
            plot.caption = element_text(color = "#adb5bd"),

            # Grid lines matching the darkly navbar border
            panel.grid.major = element_line(color = "#404146", linewidth = 0.5),
            panel.grid.minor = element_line(color = "#303136", linewidth = 0.25),

            # Transparent backgrounds
            plot.background = element_rect(fill = "transparent", color = NA),
            panel.background = element_rect(fill = "transparent", color = NA),
            legend.background = element_rect(fill = "transparent", color = NA),
            legend.key = element_rect(fill = "transparent", color = NA),
            legend.text = element_text(color = "#dee2e6"),
            legend.title = element_text(color = "#dee2e6")
        )
}
