test <- read.csv("C:\\Users\\Yao\\Dropbox\\immersion future contacts\\stats MSDS 6371 404\\stats w14 MSDS 6371 404\\test_answer_key.csv",
                        stringsAsFactors = FALSE)
train <- read.csv("C:\\Users\\Yao\\Dropbox\\immersion future contacts\\stats MSDS 6371 404\\stats w14 MSDS 6371 404\\train.csv",
                  stringsAsFactors = FALSE)
total <- rbind(train, test)
total[total == 0] <- NA
colSums(is.na(total))
round((nrow(total)-colSums(is.na(total)))/nrow(total)*100, digits = 2)

setwd("C:\\Users\\Yao\\Dropbox\\stats 2 w5 MSDS 6372 403")
write.csv(total, "total0.csv", row.names=FALSE)
str(total)

total$MSZoning[total$MSZoning=="A"]<-1
total$MSZoning[total$MSZoning=="C"]<-2
total$MSZoning[total$MSZoning=="FV"]<-3
total$MSZoning[total$MSZoning=="I"]<-4
total$MSZoning[total$MSZoning=="RH"]<-5
total$MSZoning[total$MSZoning=="RL"]<-6
total$MSZoning[total$MSZoning=="RP"]<-7
total$MSZoning[total$MSZoning=="RM"]<-8
total$MSZoning <- as.numeric(as.character(total$MSZoning))

MSZoning <- total[['MSZoning']]
MSZoning2 <- MSZoning[!is.na(MSZoning)]
MSZoning3 <- sample(MSZoning2, size=(2919-length(MSZoning2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$MSZoning[i]) == TRUE){
    total$MSZoning[i] <- MSZoning3[j]
    j<-j+1;
  }
}

LotFrontage <- total[['LotFrontage']]
LotFrontage2 <- LotFrontage[!is.na(LotFrontage)]
LotFrontage3 <- sample(LotFrontage2, size=(2919-length(LotFrontage2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$LotFrontage[i]) == TRUE){
    total$LotFrontage[i] <- LotFrontage3[j]
    j<-j+1;
  }
}

total$Alley[total$Alley=="Grvl"]<-1
total$Alley[total$Alley=="Pave"]<-2
total$Alley <- as.numeric(as.character(total$Alley))

Alley <- total[['Alley']]
Alley2 <- Alley[!is.na(Alley)]
Alley3 <- sample(Alley2, size=(2919-length(Alley2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$Alley[i]) == TRUE){
    total$Alley[i] <- Alley3[j]
    j<-j+1;
  }
}

total$Utilities[total$Utilities=="AllPub"]<-1
total$Utilities[total$Utilities=="NoSewr"]<-2
total$Utilities[total$Utilities=="NoSeWa"]<-3
total$Utilities[total$Utilities=="ELO"]<-4
total$Utilities <- as.numeric(as.character(total$Utilities))

Utilities <- total[['Utilities']]
Utilities2 <- Utilities[!is.na(Utilities)]
Utilities3 <- sample(Utilities2, size=(2919-length(Utilities2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$Utilities[i]) == TRUE){
    total$Utilities[i] <- Utilities3[j]
    j<-j+1;
  }
}

total$Exterior1st[total$Exterior1st=="AsbShng"]<-1
total$Exterior1st[total$Exterior1st=="AsphShn"]<-2
total$Exterior1st[total$Exterior1st=="BrkComm"]<-3
total$Exterior1st[total$Exterior1st=="BrkFace"]<-4
total$Exterior1st[total$Exterior1st=="CBlock"]<-5
total$Exterior1st[total$Exterior1st=="CemntBd"]<-6
total$Exterior1st[total$Exterior1st=="HdBoard"]<-7
total$Exterior1st[total$Exterior1st=="ImStucc"]<-8
total$Exterior1st[total$Exterior1st=="MetalSd"]<-9
total$Exterior1st[total$Exterior1st=="Other"]<-10
total$Exterior1st[total$Exterior1st=="Plywood"]<-11
total$Exterior1st[total$Exterior1st=="PreCast"]<-12
total$Exterior1st[total$Exterior1st=="Stone"]<-13
total$Exterior1st[total$Exterior1st=="Stucco"]<-14
total$Exterior1st[total$Exterior1st=="VinylSd"]<-15
total$Exterior1st[total$Exterior1st=="Wd Sdng"]<-16
total$Exterior1st[total$Exterior1st=="WdShing"]<-17
total$Exterior1st <- as.numeric(as.character(total$Exterior1st))

Exterior1st <- total[['Exterior1st']]
Exterior1st2 <- Exterior1st[!is.na(Exterior1st)]
Exterior1st3 <- sample(Exterior1st2, size=(2919-length(Exterior1st2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$Exterior1st[i]) == TRUE){
    total$Exterior1st[i] <- Exterior1st3[j]
    j<-j+1;
  }
}

total$Exterior2nd[total$Exterior2nd=="AsbShng"]<-1
total$Exterior2nd[total$Exterior2nd=="AsphShn"]<-2
total$Exterior2nd[total$Exterior2nd=="BrkComm"]<-3
total$Exterior2nd[total$Exterior2nd=="BrkFace"]<-4
total$Exterior2nd[total$Exterior2nd=="CBlock"]<-5
total$Exterior2nd[total$Exterior2nd=="CemntBd"]<-6
total$Exterior2nd[total$Exterior2nd=="HdBoard"]<-7
total$Exterior2nd[total$Exterior2nd=="ImStucc"]<-8
total$Exterior2nd[total$Exterior2nd=="MetalSd"]<-9
total$Exterior2nd[total$Exterior2nd=="Other"]<-10
total$Exterior2nd[total$Exterior2nd=="Plywood"]<-11
total$Exterior2nd[total$Exterior2nd=="PreCast"]<-12
total$Exterior2nd[total$Exterior2nd=="Stone"]<-13
total$Exterior2nd[total$Exterior2nd=="Stucco"]<-14
total$Exterior2nd[total$Exterior2nd=="VinylSd"]<-15
total$Exterior2nd[total$Exterior2nd=="Wd Sdng"]<-16
total$Exterior2nd[total$Exterior2nd=="WdShing"]<-17
total$Exterior2nd <- as.numeric(as.character(total$Exterior2nd))

Exterior2nd <- total[['Exterior2nd']]
Exterior2nd2 <- Exterior2nd[!is.na(Exterior2nd)]
Exterior2nd3 <- sample(Exterior2nd2, size=(2919-length(Exterior2nd2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$Exterior2nd[i]) == TRUE){
    total$Exterior2nd[i] <- Exterior2nd3[j]
    j<-j+1;
  }
}

total$MasVnrType[total$MasVnrType=="BrkCmn"]<-1
total$MasVnrType[total$MasVnrType=="BrkFace"]<-2
total$MasVnrType[total$MasVnrType=="CBlock"]<-3
total$MasVnrType[total$MasVnrType=="None"]<-4
total$MasVnrType[total$MasVnrType=="Stone"]<-5
total$MasVnrType <- as.numeric(as.character(total$MasVnrType))

MasVnrType <- total[['MasVnrType']]
MasVnrType2 <- MasVnrType[!is.na(MasVnrType)]
MasVnrType3 <- sample(MasVnrType2, size=(2919-length(MasVnrType2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$MasVnrType[i]) == TRUE){
    total$MasVnrType[i] <- MasVnrType3[j]
    j<-j+1;
  }
}

MasVnrArea <- total[['MasVnrArea']]
MasVnrArea2 <- MasVnrArea[!is.na(MasVnrArea)]
MasVnrArea3 <- sample(MasVnrArea2, size=(2919-length(MasVnrArea2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$MasVnrArea[i]) == TRUE){
    total$MasVnrArea[i] <- MasVnrArea3[j]
    j<-j+1;
  }
}

total$BsmtQual[total$BsmtQual=="Ex"]<-1
total$BsmtQual[total$BsmtQual=="Gd"]<-2
total$BsmtQual[total$BsmtQual=="TA"]<-3
total$BsmtQual[total$BsmtQual=="Fa"]<-4
total$BsmtQual[total$BsmtQual=="Po"]<-5
total$BsmtQual[is.na(total$BsmtQual)]<-6
total$BsmtQual <- as.numeric(as.character(total$BsmtQual))

total$BsmtCond[total$BsmtCond=="Ex"]<-1
total$BsmtCond[total$BsmtCond=="Gd"]<-2
total$BsmtCond[total$BsmtCond=="TA"]<-3
total$BsmtCond[total$BsmtCond=="Fa"]<-4
total$BsmtCond[total$BsmtCond=="Po"]<-5
total$BsmtCond[is.na(total$BsmtCond)]<-6
total$BsmtCond <- as.numeric(as.character(total$BsmtCond))

total$BsmtExposure[total$BsmtExposure=="Gd"]<-1
total$BsmtExposure[total$BsmtExposure=="Av"]<-2
total$BsmtExposure[total$BsmtExposure=="Mn"]<-3
total$BsmtExposure[total$BsmtExposure=="No"]<-4
total$BsmtExposure[is.na(total$BsmtExposure)]<-5
total$BsmtExposure <- as.numeric(as.character(total$BsmtExposure))

total$BsmtFinType1[total$BsmtFinType1=="GLQ"]<-1
total$BsmtFinType1[total$BsmtFinType1=="ALQ"]<-2
total$BsmtFinType1[total$BsmtFinType1=="BLQ"]<-3
total$BsmtFinType1[total$BsmtFinType1=="Rec"]<-4
total$BsmtFinType1[total$BsmtFinType1=="LwQ"]<-5
total$BsmtFinType1[total$BsmtFinType1=="Unf"]<-6
total$BsmtFinType1[is.na(total$BsmtFinType1)]<-7
total$BsmtFinType1 <- as.numeric(as.character(total$BsmtFinType1))

BsmtFinSF1 <- total[['BsmtFinSF1']]
BsmtFinSF12 <- BsmtFinSF1[!is.na(BsmtFinSF1)]
BsmtFinSF13 <- sample(BsmtFinSF12, size=(2919-length(BsmtFinSF12)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$BsmtFinSF1[i]) == TRUE){
    total$BsmtFinSF1[i] <- BsmtFinSF13[j]
    j<-j+1;
  }
}

total$BsmtFinType2[total$BsmtFinType2=="GLQ"]<-1
total$BsmtFinType2[total$BsmtFinType2=="ALQ"]<-2
total$BsmtFinType2[total$BsmtFinType2=="BLQ"]<-3
total$BsmtFinType2[total$BsmtFinType2=="Rec"]<-4
total$BsmtFinType2[total$BsmtFinType2=="LwQ"]<-5
total$BsmtFinType2[total$BsmtFinType2=="Unf"]<-6
total$BsmtFinType2[is.na(total$BsmtFinType2)]<-7
total$BsmtFinType2 <- as.numeric(as.character(total$BsmtFinType2))

total$BsmtFinSF2[is.na(total$BsmtFinSF2)]<-0

BsmtUnfSF <- total[['BsmtUnfSF']]
BsmtUnfSF2 <- BsmtUnfSF[!is.na(BsmtUnfSF)]
BsmtUnfSF3 <- sample(BsmtUnfSF2, size=(2919-length(BsmtUnfSF2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$BsmtUnfSF[i]) == TRUE){
    total$BsmtUnfSF[i] <- BsmtUnfSF3[j]
    j<-j+1;
  }
}

TotalBsmtSF <- total[['TotalBsmtSF']]
TotalBsmtSF2 <- TotalBsmtSF[!is.na(TotalBsmtSF)]
TotalBsmtSF3 <- sample(TotalBsmtSF2, size=(2919-length(TotalBsmtSF2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$TotalBsmtSF[i]) == TRUE){
    total$TotalBsmtSF[i] <- TotalBsmtSF3[j]
    j<-j+1;
  }
}

total$Electrical[total$Electrical=="SBrkr"]<-1
total$Electrical[total$Electrical=="FuseA"]<-2
total$Electrical[total$Electrical=="FuseF"]<-3
total$Electrical[total$Electrical=="FuseP"]<-4
total$Electrical[total$Electrical=="Mix"]<-5
total$Electrical <- as.numeric(as.character(total$Electrical))

Electrical <- total[['Electrical']]
Electrical2 <- Electrical[!is.na(Electrical)]
Electrical3 <- sample(Electrical2, size=(2919-length(Electrical2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$Electrical[i]) == TRUE){
    total$Electrical[i] <- Electrical3[j]
    j<-j+1;
  }
}

X2ndFlrSF <- total[['X2ndFlrSF']]
X2ndFlrSF2 <- X2ndFlrSF[!is.na(X2ndFlrSF)]
X2ndFlrSF3 <- sample(X2ndFlrSF2, size=(2919-length(X2ndFlrSF2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$X2ndFlrSF[i]) == TRUE){
    total$X2ndFlrSF[i] <- X2ndFlrSF3[j]
    j<-j+1;
  }
}

LowQualFinSF <- total[['LowQualFinSF']]
LowQualFinSF2 <- LowQualFinSF[!is.na(LowQualFinSF)]
LowQualFinSF3 <- sample(LowQualFinSF2, size=(2919-length(LowQualFinSF2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$LowQualFinSF[i]) == TRUE){
    total$LowQualFinSF[i] <- LowQualFinSF3[j]
    j<-j+1;
  }
}

total$BsmtFullBath[is.na(total$BsmtFullBath)] <- 0
total$BsmtHalfBath[is.na(total$BsmtHalfBath)] <- 0
total$FullBath[is.na(total$FullBath)] <- 0
total$HalfBath[is.na(total$HalfBath)] <- 0

BedroomAbvGr <- total[['BedroomAbvGr']]
BedroomAbvGr2 <- BedroomAbvGr[!is.na(BedroomAbvGr)]
BedroomAbvGr3 <- sample(BedroomAbvGr2, size=(2919-length(BedroomAbvGr2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$BedroomAbvGr[i]) == TRUE){
    total$BedroomAbvGr[i] <- BedroomAbvGr3[j]
    j<-j+1;
  }
}

KitchenAbvGr <- total[['KitchenAbvGr']]
KitchenAbvGr2 <- KitchenAbvGr[!is.na(KitchenAbvGr)]
KitchenAbvGr3 <- sample(KitchenAbvGr2, size=(2919-length(KitchenAbvGr2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$KitchenAbvGr[i]) == TRUE){
    total$KitchenAbvGr[i] <- KitchenAbvGr3[j]
    j<-j+1;
  }
}

total$KitchenQual[total$KitchenQual=="Ex"]<-1
total$KitchenQual[total$KitchenQual=="Gd"]<-2
total$KitchenQual[total$KitchenQual=="TA"]<-3
total$KitchenQual[total$KitchenQual=="Fa"]<-4
total$KitchenQual[total$KitchenQual=="Po"]<-5
total$KitchenQual <- as.numeric(as.character(total$KitchenQual))

KitchenQual <- total[['KitchenQual']]
KitchenQual2 <- KitchenQual[!is.na(KitchenQual)]
KitchenQual3 <- sample(KitchenQual2, size=(2919-length(KitchenQual2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$KitchenQual[i]) == TRUE){
    total$KitchenQual[i] <- KitchenQual3[j]
    j<-j+1;
  }
}

total$Functional[total$Functional=="Typ"]<-1
total$Functional[total$Functional=="Min1"]<-2
total$Functional[total$Functional=="Min2"]<-3
total$Functional[total$Functional=="Mod"]<-4
total$Functional[total$Functional=="Maj1"]<-5
total$Functional[total$Functional=="Maj2"]<-6
total$Functional[total$Functional=="Sev"]<-7
total$Functional[total$Functional=="Sal"]<-8
total$Functional <- as.numeric(as.character(total$Functional))

Functional <- total[['Functional']]
Functional2 <- Functional[!is.na(Functional)]
Functional3 <- sample(Functional2, size=(2919-length(Functional2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$Functional[i]) == TRUE){
    total$Functional[i] <- Functional3[j]
    j<-j+1;
  }
}

total$Fireplaces[is.na(total$Fireplaces)] <- 0

total$FireplaceQu[total$FireplaceQu=="Ex"]<-1
total$FireplaceQu[total$FireplaceQu=="Gd"]<-2
total$FireplaceQu[total$FireplaceQu=="TA"]<-3
total$FireplaceQu[total$FireplaceQu=="Fa"]<-4
total$FireplaceQu[total$FireplaceQu=="Po"]<-5
total$FireplaceQu[is.na(total$FireplaceQu)] <-6
total$FireplaceQu <- as.numeric(as.character(total$FireplaceQu))

total$GarageType[total$GarageType=="2Types"]<-1
total$GarageType[total$GarageType=="Attchd"]<-2
total$GarageType[total$GarageType=="Basment"]<-3
total$GarageType[total$GarageType=="BuiltIn"]<-4
total$GarageType[total$GarageType=="CarPort"]<-5
total$GarageType[total$GarageType=="Detchd"]<-6
total$GarageType[is.na(total$GarageType)]<-7
total$GarageType <- as.numeric(as.character(total$GarageType))

GarageYrBlt <- total[['GarageYrBlt']]
GarageYrBlt2 <- GarageYrBlt[!is.na(GarageYrBlt)]
GarageYrBlt3 <- sample(GarageYrBlt2, size=(2919-length(GarageYrBlt2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$GarageYrBlt[i]) == TRUE){
    total$GarageYrBlt[i] <- GarageYrBlt3[j]
    j<-j+1;
  }
}

total$GarageFinish[total$GarageFinish=="Fin"]<-1
total$GarageFinish[total$GarageFinish=="RFn"]<-2
total$GarageFinish[total$GarageFinish=="Unf"]<-3
total$GarageFinish[is.na(total$GarageFinish)] <-4
total$GarageFinish <- as.numeric(as.character(total$GarageFinish))

total$GarageCars[is.na(total$GarageCars)] <-0

total$GarageArea[is.na(total$GarageArea)] <-0

total$GarageQual[total$GarageQual=="Ex"]<-1
total$GarageQual[total$GarageQual=="Gd"]<-2
total$GarageQual[total$GarageQual=="TA"]<-3
total$GarageQual[total$GarageQual=="Fa"]<-4
total$GarageQual[total$GarageQual=="Po"]<-5
total$GarageQual[is.na(total$GarageQual)]<-6
total$GarageQual <- as.numeric(as.character(total$GarageQual))

total$GarageCond[total$GarageCond=="Ex"]<-1
total$GarageCond[total$GarageCond=="Gd"]<-2
total$GarageCond[total$GarageCond=="TA"]<-3
total$GarageCond[total$GarageCond=="Fa"]<-4
total$GarageCond[total$GarageCond=="Po"]<-5
total$GarageCond[is.na(total$GarageCond)]<-6
total$GarageCond <- as.numeric(as.character(total$GarageCond))

total$WoodDeckSF[is.na(total$WoodDeckSF)]<-0

total$OpenPorchSF[is.na(total$OpenPorchSF)]<-0

total$EnclosedPorch[is.na(total$EnclosedPorch)]<-0

total$X3SsnPorch[is.na(total$X3SsnPorch)]<-0

total$ScreenPorch[is.na(total$ScreenPorch)]<-0

total$PoolArea[is.na(total$PoolArea)]<-0

total$PoolQC[total$PoolQC=="Ex"]<-1
total$PoolQC[total$PoolQC=="Gd"]<-2
total$PoolQC[total$PoolQC=="TA"]<-3
total$PoolQC[total$PoolQC=="Fa"]<-4
total$PoolQC[is.na(total$PoolQC)]<-5
total$PoolQC <- as.numeric(as.character(total$PoolQC))

total$Fence[total$Fence=="GdPrv"]<-1
total$Fence[total$Fence=="MnPrv"]<-2
total$Fence[total$Fence=="GdWo"]<-3
total$Fence[total$Fence=="MnWw"]<-4
total$Fence[is.na(total$Fence)]<-5
total$Fence <- as.numeric(as.character(total$Fence))

total$MiscFeature[total$MiscFeature=="Elev"]<-1
total$MiscFeature[total$MiscFeature=="Gar2"]<-2
total$MiscFeature[total$MiscFeature=="Othr"]<-3
total$MiscFeature[total$MiscFeature=="Shed"]<-4
total$MiscFeature[total$MiscFeature=="TenC"]<-5
total$MiscFeature[is.na(total$MiscFeature)]<-6
total$MiscFeature <- as.numeric(as.character(total$MiscFeature))

total$MiscVal[is.na(total$MiscVal)]<-0

total$SaleType[total$SaleType=="WD "]<-1
total$SaleType[total$SaleType=="CWD"]<-2
total$SaleType[total$SaleType=="VWD"]<-3
total$SaleType[total$SaleType=="New"]<-4
total$SaleType[total$SaleType=="COD"]<-5
total$SaleType[total$SaleType=="Con"]<-6
total$SaleType[total$SaleType=="ConLw"]<-7
total$SaleType[total$SaleType=="ConLI"]<-8
total$SaleType[total$SaleType=="ConLD"]<-9
total$SaleType[total$SaleType=="Oth"]<-10
total$SaleType <- as.numeric(as.character(total$SaleType))

SaleType <- total[['SaleType']]
SaleType2 <- SaleType[!is.na(SaleType)]
SaleType3 <- sample(SaleType2, size=(2919-length(SaleType2)), replace=TRUE)

j<-1
for(i in 1:2919){
  if(is.na(total$SaleType[i]) == TRUE){
    total$SaleType[i] <- SaleType3[j]
    j<-j+1;
  }
}

total75 <- total[, !(colnames(total) %in% c("Alley","MasVnrArea","BsmtFinSF1","BsmtFinSF2",
                                           "X2ndFlrSF", "LowQualFinSF", "BsmtFullBath",
                                           "BsmtHalfBath","HalfBath","Fireplaces","FireplaceQu",
                                           "WoodDeckSF","OpenPorchSF","EnclosedPorch","X3SsnPorch",
                                           "ScreenPorch","PoolArea","PoolQC","Fence","MiscFeature",
                                           "MiscVal"))]

total50 <- total[, !(colnames(total) %in% c("Alley","MasVnrArea","BsmtFinSF2",
                                           "X2ndFlrSF", "LowQualFinSF", "BsmtFullBath",
                                           "BsmtHalfBath","HalfBath",
                                           "WoodDeckSF","EnclosedPorch","X3SsnPorch",
                                           "ScreenPorch","PoolArea","PoolQC","Fence","MiscFeature",
                                           "MiscVal"))]



trainfull <- total[1:1460,]
testfull <- total[1461:2919,]

train50imp <- total50[1:1460,]
test50imp <- total50[1461:2919,]

train75imp <- total75[1:1460,]
test75imp <- total75[1461:2919,]

write.csv(total, "totalfull.csv", row.names=FALSE)
write.csv(total50, "total50.csv", row.names=FALSE)
write.csv(total75, "total75.csv", row.names=FALSE)

write.csv(trainfull, "trainfull.csv", row.names=FALSE)
write.csv(testfull, "testfull.csv", row.names=FALSE)

write.csv(train50imp, "train50imp.csv", row.names=FALSE)
write.csv(test50imp, "test50imp.csv", row.names=FALSE)

write.csv(train75imp, "train75imp.csv", row.names=FALSE)
write.csv(test75imp, "test75imp.csv", row.names=FALSE)