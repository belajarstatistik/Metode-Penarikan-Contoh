# Membuat data frame terlebih dahulu
df <- data.frame(No_ruta_sampel = 1:20,
                 Jumlah_ART = c(4,2,3,5,4,6,3,4,5,7,3,4,6,2,1,2,3,4,6,4))

# Menampilkan 6 data teratas
head(df)

# Karena ukuran populasinya diketahui maka membuat variabel baru yang berisi ukuran populasinya (N)
library(dplyr)
df <- mutate(.data = df, N=150)

# Menampilkan 6 data teratas
head(df)

# Menggunakan package "survey"
library(survey)

# Membuat design SRS ke dalam variabel "design_srs"
design_srs <- svydesign(ids = ~1, fpc = ~N, data = df)

# Menampilkan estimasi rata-rata dan standard error dari estimasi rata-rata
svymean(x = ~Jumlah_ART, design = design_srs)

# Menampilkan selang kepercayaan 95% dari rata-rata
confint(svymean(x = ~Jumlah_ART, design = design_srs), level = 0.95)

# Menampilkan estimasi total dan standard error dari estimasi total
svytotal(x = ~Jumlah_ART, design = design_srs)

# Menampilkan selang kepercayaan 95% dari total
confint(svytotal(x = ~Jumlah_ART, design = design_srs), level = 0.95)