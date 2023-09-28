##
## Exploración y análisis de datos
## Entrega #1, Visualización y gráficos con R
## Federike, Kevin, 2023-09-22

## Gráfico 1 : Contaminacion del Agua en Euskadi en 2021
##               La idea es mostrar las cinco substancias más vertidas, 
##               y siete menos vertidas (en terminos de masa) en el
##               agua en todo Euskadi en 2021. Pretende demostrar que
##               algunas substancias se emitten en sus miles de toneladas,
##               y otras en sus miligramos. 

rm(list=ls())
graphics.off() 
library(ggplot2)
library(grid)
library(gridExtra)
top_colors <- c("darkorange3","darkgreen","gold4","firebrick","darkorchid",
                  "deepskyblue4","darkmagenta","aquamarine4","deeppink4","chocolate4")
bot_colors <- c("mistyrose","lightcyan","lightgreen","lavender","lightgoldenrod1",
                  "wheat1","lightblue1","pink","slategray1","papayawhip")
label_length <- 35

# Read data
getwd()
df <- read.table("./agua_eprtr.csv", header=TRUE, sep=";")
df$Label = substr(df$Descripción, 1, label_length)

# Build dataframes
contaminant_key <- unique(subset(df,select=c(14,15,18)))
aggregated <- setNames(aggregate(df$Cantidad..Kg.año., by=list(Category=df$Contaminante), FUN=sum), c("Contaminante","Total_mass_kg"))
sorted <- aggregated[order(aggregated$Total_mass_kg, decreasing=TRUE),]
sorted$Rank_by_mass <- 1:nrow(sorted)
filtered <- sorted[apply(sorted, 1, function(row) all(row !=0)),]
merged <- merge(x=filtered,y=contaminant_key, by=c("Contaminante"))
merged <- merged[order(merged$Rank_by_mass),]

# Title
overall_title <- textGrob("Contaminacion del Agua en Euskadi en 2021",gp=gpar(fontsize=18,fontface="bold"))

# Create barplots
top_plot <- ggplot(data=head(merged,5), aes(x=reorder(Label,-Rank_by_mass), y=Total_mass_kg/1000, fill=Label)) +
  geom_bar(stat="identity") + scale_fill_manual(values=top_colors) + 
  ggtitle("Sustancias químicas registradas con masa acumulativa más significativa", subtitle="(Emisiones en toneladas)") + 
  ylab("Masa Total / Año (Toneladas Métricas)") +
  theme_minimal() + coord_flip() +
  theme(legend.position="none", axis.title.y=element_blank(), plot.title = element_text(face="bold") )
bot_plot <- ggplot(data=tail(merged,8), aes(x=reorder(Label,-Rank_by_mass), y=Total_mass_kg*1000, fill=Label)) +
  geom_bar(stat="identity") + scale_fill_manual(values=bot_colors) +
  ggtitle("Sustancias químicas registradas con masa acumulativa menos significativa", subtitle="(Emisiones en gramos)") + 
  ylab("Masa Total / Año (Gramos)") +
  theme_minimal() + coord_flip() +
  theme(legend.position="none", axis.title.y=element_blank(), plot.title = element_text(face="bold") )

# Compose graphic
grid.arrange(grobs=list(overall_title, top_plot, bot_plot), heights=c(1,5,5), ncol=1)


## Gráfico 2 : Contaminacion del Agua en Euskadi por Provincia en 2021
##               Con esta grafica representamos la contaminación total vertida
##               en el agua por provincia en 2021. Los contribuyentes más 
##               importantes estan desglosados, pero logicamente, las 
##               substancias medidas en kilogramos o gramos no son visibles

rm(list=ls())
graphics.off() 
library(ggplot2)
library(gridExtra)

slice_labels <- 5
label_length <- 35

getwd()
df <- read.table("./agua_eprtr.csv", header=TRUE, sep=";")
df$Label = substr(df$Descripción, 1, label_length)

#second graphic
contaminant_key <- unique(subset(df,select=c(14,15,18)))
aggregated <- setNames(aggregate(df$Cantidad..Kg.año., by=list(Category=df$Provincia,Category=df$Contaminante), FUN=sum), c("Provincia","Contaminante","Total_mass_kg"))
sorted <- aggregated[order(aggregated$Provincia, aggregated$Total_mass_kg, decreasing=TRUE),]
sorted$Rank_by_province_and_mass <- 1:nrow(sorted)
filtered <- sorted[apply(sorted, 1, function(row) all(row !=0)),]
merged <- merge(x=filtered,y=contaminant_key, by=c("Contaminante"))
merged <- merged[order(merged$Rank_by_province_and_mass),]

Araba <- subset(merged, Provincia=="Araba/Álava")
Araba_top <- head(Araba, slice_labels) 
Araba_top$Label <- substr(Araba_top$Descripción, 1, label_length)
Araba_bot <- tail(Araba,(dim(Araba))[1]-slice_labels)
Araba_bot$Label <- "Other"
Araba <- rbind(Araba_top, Araba_bot)
Bizkaia <- subset(merged, Provincia=="Bizkaia")
Bizkaia_top <- head(Bizkaia,slice_labels) 
Bizkaia_top$Label <- substr(Bizkaia_top$Descripción, 1, label_length)
Bizkaia_bot <- tail(Bizkaia,(dim(Bizkaia))[1]-slice_labels)
Bizkaia_bot$Label <- "Other"
Bizkaia <- rbind(Bizkaia_top, Bizkaia_bot)
Gipuzkoa <- subset(merged, Provincia=="Gipuzkoa")
Gipuzkoa_top <- head(Gipuzkoa,slice_labels) 
Gipuzkoa_top$Label <- substr(Gipuzkoa_top$Descripción, 1, label_length)
Gipuzkoa_bot <- tail(Gipuzkoa,(dim(Gipuzkoa))[1]-slice_labels)
Gipuzkoa_bot$Label <- "Other"
Gipuzkoa <- rbind(Gipuzkoa_top, Gipuzkoa_bot)
merged <- rbind(Araba,Bizkaia,Gipuzkoa)
rm(list=c("Araba","Araba_top","Araba_bot",
          "Bizkaia","Bizkaia_top","Bizkaia_bot",
          "Gipuzkoa","Gipuzkoa_top","Gipuzkoa_bot"))

# Barplot
plot <- ggplot(data=merged, aes(x=reorder(Provincia,-Contaminante), y=Total_mass_kg/1000, fill=Label)) +
  geom_col() + 
  ggtitle("Contaminacion del Agua en Euskadi por Provincia en 2021",subtitle="") + 
  ylab("Masa Total / Año (Toneladas Métricas)") +
  xlab("Provincias") +
  guides(fill = guide_legend(title="Legend")) +
  theme_classic() +
  theme(axis.title.x=element_blank(), #remove x axis labels
        legend.position = "top",
        plot.title=element_text(hjust=0.5, size=18, face="bold")
  )
plot


## Gráfico 3 : Contaminacion del Aire por Provincia y Municipio en 2021
##               Con esta grafica pretendemos resaltar los municipios mas
##               relevantes en la contaminación del aire en cada provincia

rm(list=ls())
graphics.off() 
library(ggplot2)
library(gridExtra)
library(ggrepel)

pie_labels <- 5
label_length <- 35

getwd()
df <- read.table("./aire_eprtr.csv", header=TRUE, sep=";")

province_key <- unique(subset(df,select=c(7,8)))
aggregated <- aggregate(df$Cantidad..Kg.año.,by=list(Category=df$Municipio), FUN=sum)
aggregated <- setNames(aggregated, c("Municipio","Total_mass_kg"))
merged <- merge(x=aggregated,y=province_key, by=c("Municipio"))
merged <- merged[,c(1,3,2)]
sorted <- merged[order(merged$Provincia, merged$Total_mass_kg, decreasing=TRUE),]
sorted$Rank_by_province_and_mass <- 1:nrow(sorted)

Araba <- subset(sorted, Provincia=="Araba/Álava")
Araba_top <- head(Araba,pie_labels) 
Araba_top$Label <- substr(Araba_top$Municipio, 1, label_length)
Araba_top$Total_mass_kg_label <- substr(Araba_top$Total_mass_kg, 1, label_length)
Araba_bot <- tail(Araba,(dim(Araba))[1]-pie_labels)
Araba_bot$Label <- "Other"
Araba_bot$Total_mass_kg_label <- NA
Araba <- rbind(Araba_top, Araba_bot)

Bizkaia <- subset(sorted, Provincia=="Bizkaia")
Bizkaia_top <- head(Bizkaia,pie_labels) 
Bizkaia_top$Label <- substr(Bizkaia_top$Municipio, 1, label_length)
Bizkaia_top$Total_mass_kg_label <- substr(Bizkaia_top$Total_mass_kg, 1, label_length)
Bizkaia_bot <- tail(Bizkaia,(dim(Bizkaia))[1]-pie_labels)
Bizkaia_bot$Label <- "Other"
Bizkaia_bot$Total_mass_kg_label <- NA
Bizkaia <- rbind(Bizkaia_top, Bizkaia_bot)

Gipuzkoa <- subset(sorted, Provincia=="Gipuzkoa")
Gipuzkoa_top <- head(Gipuzkoa,pie_labels) 
Gipuzkoa_top$Label <- substr(Gipuzkoa_top$Municipio, 1, label_length)
Gipuzkoa_top$Total_mass_kg_label <- substr(Gipuzkoa_top$Total_mass_kg, 1, label_length)
Gipuzkoa_bot <- tail(Gipuzkoa,(dim(Gipuzkoa))[1]-pie_labels)
Gipuzkoa_bot$Label <- "Other"
Gipuzkoa_bot$Total_mass_kg_label <- NA
Gipuzkoa <- rbind(Gipuzkoa_top, Gipuzkoa_bot)

# Title
overall_title <- textGrob("Contaminacion del Aire por Provincia y Municipio en 2021",gp=gpar(fontsize=14,fontface="bold"))

#create pie chart
Araba_plot <- ggplot(Araba, aes(x="", y=Total_mass_kg, fill=Label)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(x = NULL, y = NULL, fill = NULL) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title=element_text(hjust=0.5, size=12, face="bold")) +
  scale_fill_brewer(palette="Reds") +
  ggtitle("Araba/Álvara") 
Araba_plot

Bizkaia_plot <- ggplot(Bizkaia, aes(x="", y=Total_mass_kg, fill=Label)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(x = NULL, y = NULL, fill = NULL) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title=element_text(hjust=0.5, size=12, face="bold")) +
  scale_fill_brewer(palette="Blues") +
  ggtitle("Bizkaia")

Gipuzkoa_plot <- ggplot(Gipuzkoa, aes(x="", y=Total_mass_kg, fill=Label)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(x = NULL, y = NULL, fill = NULL) +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title=element_text(hjust=0.5, size=12, face="bold")) +
  scale_fill_brewer(palette="Greens") +
  ggtitle("Gipuzkoa")


#arrange the plots
grid.arrange(overall_title, Araba_plot, Bizkaia_plot, Gipuzkoa_plot, widths=c(1, 1), heights=c(1.5,5,5),
             layout_matrix = rbind(c(1, 1),
                                   c(2, 3),
                                   c(4, 4))
)

