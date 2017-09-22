# Reading From Other Sources

# Interacting more directly with flies
- file - open a connection to a text file
- url - open a connection to a url
- gzfile - open a connection to a .gz file
- bzfile - open a connection to a .bz2 file
?connections for more information

p/s:Remember to close connections

# Foreign package

- Load data from Minitab, S, SAS, SPSS, Stata, Systat
- Basic functions read.foo

- read.aff (Weka)
- read.dta (Stata)
- read.mtp (Minitab)
- read.octave (Octave)
- read.spss (SPSS)
- read.xport (SAS)

# Examples of other database packages

RPostressSQL provides a DBI-compliant database connection form R. 
Tutorial - https://code.google.com/p/rpostgresql/
help file - http://cran.r-project.org/web/packages/RPostgreSQL/RPostgreSQL.pdf

RODBC provides interfaces to multiple databases including PostgreQL, MySQL, Microsoft Access and SQLite.
Tutorial - http://cran.r-project.org/web/packages/RODBC/vignettes/RODBC.pdf
help file - http://cran.r-project.org/web/packages/RODBC/RODBC.pdf

RMongo 
Tutorial - http://cran.r-project.org/web/packages/RMongo/RMongo.pdf
example - http://www.r-bloggers.com/r-and-mongodb/

# Reading Images
- jpeg - http://cran.r-project.org/packages/jpeg/index.html
- readbitmap http://cran.r-project.org/packages/readbitmap/index.html
- png - http://cran.r-project.org/packages/png/index.html
- EBImage (Bioconductor) - http://www.bioconductor.org/packages/2.13/bioc/html/EBImage.html

# Reading GIS data (Geographic Information Systems)
- rdgal - http://cran.r-project.org/web/packages/rdgal/index.html
- rgeos - http://cran.r-project/web/packages/rgeos/index.html
- raster - http://cran.r-project.org/packages/raster/index.html

# Reading Music data
- tuneR - http://cran.r-project.org/web/packages/tuneR/
- seewave - http://rug.mnhn.fr/seewave/
