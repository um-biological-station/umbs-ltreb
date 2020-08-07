agb <- read_csv("plots/agb_plots.csv")
cwd <- read_csv("plots/cwd_plots.csv")
sap <- read_csv("plots/saplings_plots.csv")
soils <- read_csv("plots/soils_plots.csv")

agb
cwd
sap
soils

plots <- append(agb$x, cwd$x)
plots <- append(plots, sap$x)
plots <- append(plots, soils$x)
plot <- unique(plots)
plot <- as_tibble(plot)
plot <- plot %>% rename(Name = value) %>% arrange(Name)
write_csv(plot, "plots/all_plots.csv")

info <- read_csv("plots/all_plots_JTEdits_08_03_2020.csv")
setdiff(plot$Name, info$Plot_ID)

write_csv(info, "output/UMBS_plots.csv")
