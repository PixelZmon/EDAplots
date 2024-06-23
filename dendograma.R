#file.choose() #Buscar ruta del archivo excel y mostrarlo en consola en formato que lo entiende R
library(readxl)
library("compositions") #cargar libreria compositions
library(cluster)
library(purrr)
ruta_excel <- "c:\\Users\\sebastian\\R\\Cluster\\clr.xlsx"

excel_sheets(ruta_excel) #arroja nombre de las hojas del excel
data <- read_excel(ruta_excel) #leer el excel
as.data.frame(data) #hacer el excel un dataframe
elementos <- data$Elemento #etiqueta que se usara en label del plot
data <-data[-1] #tomar los datos sin el nombre de los elementos


d <- dist(data, method = "euclidean") #crear matriz euclidiana
hc1 <- hclust(d, method = "single" ) #hacer dendograma con enlace unico
jpeg(filename="Cluster.jpeg", width=15,height=15, res= 300, units = "cm")
plot(hc1, labels=elementos, main = "Dendograma que utiliza un enlace único") #graficar dendograma con nombre de los elementos
#rect.hclust(hc1