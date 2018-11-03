library("xlsx");
library(rpart);
library(rpart.plot);

# Importation des données
donnees <- read.xlsx("N:/Risk.xls",sheetName="Risk");

# Quelques statistiques ..
summary(donnees);

# Construction de l'arbre avec l'algorithme de partitionnement récursif en se basant sur le critère d'indice de Gini (critère par défaut)
ad.risque.cnt = rpart.control(minsplit=50);
ad.risque = rpart(RISK~AGE+INCOME+GENDER+MARITAL+NUMKIDS+NUMCARDS+HOWPAID+MORTGAGE+STORECAR+LOANS, donnees, control = ad.risque.cnt);

# Visualisation
rpart.plot(ad.risque);