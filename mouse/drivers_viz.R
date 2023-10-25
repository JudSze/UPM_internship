install.packages("colourpicker")
install.packages("esquisse")
install.packages("rgl")
devtools::install_github("thomasp85/patchwork")

library(ggplot2)
library(RColorBrewer)
library(colourpicker) #color browsing
library(esquisse) #manual plotting
library(rgl) #3D visualization
library(patchwork)

#with covariates
n_10d_VS_t_10d = read.csv("C:/Coselens/mouse/finalized_results/5_covs_aligned_gens/cv_n_10d_VS_t_10d.csv", sep = ";")
t_10d_VS_t_1y = read.csv("C:/Coselens/mouse/finalized_results/5_covs_aligned_gens/cv_t_10d_VS_t_1y.csv", sep = ";")
n_10d_VS_t_1y = read.csv("C:/Coselens/mouse/finalized_results/5_covs_aligned_gens/cv_n_10d_VS_t_1y.csv", sep = ";")


#filtering datasets
filt_n_10d_VS_t_10d = dplyr::filter(n_10d_VS_t_10d, classification != "independence")
filt_t_10d_VS_t_1y = dplyr::filter(t_10d_VS_t_1y, classification != "independence")
filt_n_10d_VS_t_1y = dplyr::filter(n_10d_VS_t_1y, classification != "independence")

#visualization
#colors
colors = colourPicker() #find any color, code, and R name

n <- length(unique(n_10d$gene))
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

#plot
esquisse::esquisser() #create plot manually

# demo(rgl) - rgl demo with tons of plots

#patchwork
p1 = ggplot(filt_n_10d_VS_t_10d) +
  aes(x = gene_name, y = Delta.Nd, fill = classification) +
  geom_col() +
  scale_fill_manual(values = c(facilitation = "#FFA54F", `strict inhibition` = "#FFFFAA", unclassified = "#EE4000"
  )) +
  labs(title = "Normal 10d VS Tumorous 10d") +
  theme_minimal() +
  theme(plot.title = element_text(size = 12L, 
                                  face = "bold"))

p2 = ggplot(filt_t_10d_VS_t_1y) +
  aes(x = gene_name, y = Delta.Nd, fill = classification) +
  geom_col() +
  scale_fill_manual(
    values = c(inhibition = "#8B8B00",
               `strict inhibition` = "#FFFFAA",
               unclassified = "#EE4000")
  ) +
  labs(title = "Tumorous 10d VS Tumorous 1y") +
  theme_minimal() +
  theme(plot.title = element_text(size = 12L, face = "bold"))

p3 = ggplot(filt_n_10d_VS_t_1y) +
  aes(x = gene_name, y = Delta.Nd, fill = classification) +
  geom_col() +
  scale_fill_manual(
    values = c(inhibition = "#8B8B00",
               `strict dependence` = "#CD6600",
               `strict inhibition` = "#FFFFAA",
               unclassified = "#EE4000")
  ) +
  labs(title = "Normal 10d VS Tumororus 1y") +
  theme_minimal() +
  theme(plot.title = element_text(size = 12L, face = "bold"))

#plot all plots together
(p1 + p2)/p3

#VAF viz
n_10d = read.csv("C:/Coselens/mouse/finalized_results/Targeted_seq_normal_10d_postDEN_mice_EE.csv", sep = ";")
t_10d = read.csv("C:/Coselens/mouse/finalized_results/Targeted_seq_isolated_tumors_10d_postDEN_mouse_EE.csv", sep = ";")
t_1y = read.csv("C:/Coselens/mouse/finalized_results/Targeted_seq_isolated_tumors_1y_postDEN_mouse_EE.csv", sep = ";")

esquisse::esquisser() #create plot manually

# vals = Map(function(x, y) assign(x, y, envir = .GlobalEnv), unique(n_10d$gene), col_vector)
# try_vals = as.vector(vals)

p1_impact = ggplot(n_10d) +
  aes(x = mouse, y = vaf, colour = impact) +
  geom_jitter(size = 1.2) +
  scale_color_hue(direction = 1) +
  labs(title = "Normal 10d") +
  theme_minimal()

p2_impact = ggplot(t_10d) +
  aes(x = mouse, y = vaf, colour = impact) +
  geom_jitter(size = 1.2) +
  scale_color_hue(direction = 1) +
  labs(title = "Tumororus 10d") +
  theme_minimal()

p3_impact =  ggplot(t_1y) +
  aes(x = mouse, y = vaf, colour = impact) +
  geom_jitter(size = 1.2) +
  scale_color_hue(direction = 1) +
  labs(title = "Tumororus 10d") +
  theme_minimal()

#visualize 


