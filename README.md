# Project about Extract, Transform and Load data of Air Pollution in Castilla y La Mancha

El objetivo de este proyecto consistió en realizar un proceso de extracción, transformación y carga de datos de los años 2016 hasta 2020 de seis estaciones (Toledo, Calle Ancha, Instituto, Azuqueca, Cuenca, Albacete) obtenidos a través de la [Red calidad del aire. Datos validados](
https://www.castillalamancha.es/gobierno/desarrollosostenible/estructura/dgecocir/actuaciones/red-calidad-del-aire-datos-validados-mensuales). Cabe mencionar que cada año contenía doce ficheros y cada fichero tiene doce hojas, es decir, doce estaciones pero unicamente nos interesaba seis. Así mismo, cada hoja tiene una media de 744 observaciones. Por tanto, hemos manejado una media de 267.840 datos. 

El procesamiento lo realizamos año por año, finalmente unificamos los cinco años con el objetivo de crear una única base de datos con la cual trabajar. El entorno de trabajo que utilizamos ha sido RStudio programando con el lenguaje R junto con Excel. 

