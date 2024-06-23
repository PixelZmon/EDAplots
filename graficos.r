#install.packages("readxl") ->se usa el comando install.packages("nombre-paquete) para instalar extensiones
library(readxl)
library("compositions") #cargar libreria compositions
library("sgeostat")
library("StatDA")

#file.choose() #Buscar ruta del archivo excel y mostrarlo en consola en formato que lo entiende R
ruta_excel <- "c:\\Users\\sebastian\\R\\TDL Contaminacion\\superficial-data.xlsx"

excel_sheets(ruta_excel) #arroja nombre de las hojas del excel
data <- read_excel(ruta_excel) #leer el excel
as.data.frame(data) #hacer el excel un dataframe

matrix <- data[,c("As","Cd","Cr","Cu","Hg","Pb","Se","Zn")] #Se crea una matriz a partir de data, donde se indican
#los datos que se trabajaran


matrix_clr = clr(matrix) #calcular log cociente centrada
as.data.frame(matrix_clr) #transformar la matrix en dataframe



###########################################################
jpeg(filename="As-Cd-Cr1.jpeg", width=35,height=40, res= 300, units = "cm") #Inicio Archivo con nombre y res ->resolucion
par(mfrow=c(3,2)) #graficar c(n°filas,n°columnas)

edaplot(data$As,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=100,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="As [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$As,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(As)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)

edaplot(data$Cd,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Cd [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Cd,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Cd)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)

edaplot(data$Cr,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Cr [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Cr,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Cr)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
dev.off() #Fin de la primera imagen

####################################################################
#jpeg(filename="Cu-Hg-Pb.jpeg", width=35,height=40, res= 300, units = "cm") #Inicio Archivo con nombre y res ->resolucion
par(mfrow=c(3,2)) #graficar c(n°filas,n°columnas)

edaplot(data$Cu,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=15,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Cu [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Cu,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Cu)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)

edaplot(data$Hg,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Hg [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Hg,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Hg)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)

edaplot(data$Pb,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Pb [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Pb,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Pb)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
#dev.off() #Fin de la segunda imagen

#######################################################################
#jpeg(filename="Se-Zn.jpeg", width=35,height=40, res= 300, units = "cm") #Inicio Archivo con nombre y res ->resolucion

par(mfrow=c(2,2)) #graficar c(n°filas,n°columnas)

edaplot(data$Se,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Se [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Se,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Se)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)

edaplot(data$Zn,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
        P.main="",P.xlab="Zn [mg/kg]",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
edaplotlog(matrix_clr$Zn,H.freq=FALSE,box=TRUE,H.breaks=30,H.labels=10,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
           P.main="",P.xlab="clr(Zn)",P.ylab="Relative frequency",B.pch=3,B.cex=0.5)
#dev.off() #Fin de la tercera imagen
