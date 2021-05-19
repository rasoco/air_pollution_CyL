# Project about extract and transform data of Air Pollution in Castilla y La Mancha

El objetivo de este proyecto consistió en realizar un proceso de extracción, transformación y carga de datos de los años 2016 hasta 2020 de seis estaciones (Toledo, Calle Ancha, Instituto, Azuqueca, Cuenca, Albacete) obtenidos a través de la [Red calidad del aire. Datos validados](
https://www.castillalamancha.es/gobierno/desarrollosostenible/estructura/dgecocir/actuaciones/red-calidad-del-aire-datos-validados-mensuales). Cabe mencionar que cada año esta compuesto doce ficheros y cada fichero tiene doce hojas, es decir, doce estaciones pero unicamente nos interesaba seis. Así mismo, cada hoja tiene una media de 744 datos por mes y en cada estación. Por tanto, hemos manejado una media de 267.840 datos. 

La metodología de trabajo que utilizamos fue: por un lado, procesamiento y limpieza de datos año por año y por otro lado, unificación por cada año de las seis estaciones. Una vez tuvieramos los cinco años lo unificamos en un único con el objetivo de crear una base de datos con la cual trabajar. 

Las herramientas tecnológicas utilizadas fueron: 
 - Entorno de desarrollo RStudio 
 - Lenguaje de programación R.

