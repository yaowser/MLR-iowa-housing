FILENAME REFFILE '/home/yaoy890/proj 1/totalfull.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=totalfull;
	GETNAMES=YES;
RUN;

proc sgscatter data=totalfull;
matrix SalePrice MSSubClass LotFrontage LotArea OverallQual OverallCond / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull;
matrix SalePrice YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull;
matrix SalePrice BsmtUnfSF TotalBsmtSF X1stFlrSF X2ndFlrSF LowQualFinSF / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull;
matrix SalePrice GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull;
matrix SalePrice BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull;
matrix SalePrice GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull;
matrix SalePrice X3SsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold / diagonal=(histogram) ;
run;

data totalfull2;
set totalfull;
MSSubClassl=log(MSSubClass+1);
LotFrontagel=log(LotFrontage+1);
LotAreal=log(LotArea+1);
OverallQuall=log(OverallQual+1);
OverallCondl=log(OverallCond+1);
YearBuiltl=log(YearBuilt+1);
YearRemodAddl=log(YearRemodAdd+1);
MasVnrAreal=log(MasVnrArea+1);
BsmtFinSF1l=log(BsmtFinSF1+1);
BsmtFinSF2l=log(BsmtFinSF2+1);
BsmtUnfSFl=log(BsmtUnfSF+1);
TotalBsmtSFl=log(TotalBsmtSF+1);
X1stFlrSFl=log(X1stFlrSF+1);
X2ndFlrSFl=log(X2ndFlrSF+1);
LowQualFinSFl=log(LowQualFinSF+1);
GrLivAreal=log(GrLivArea+1);
BsmtFullBathl=log(BsmtFullBath+1);
BsmtHalfBathl=log(BsmtHalfBath+1);
FullBathl=log(FullBath+1);
HalfBathl=log(HalfBath+1);
BedroomAbvGrl=log(BedroomAbvGr+1);
KitchenAbvGrl=log(KitchenAbvGr+1);
TotRmsAbvGrdl=log(TotRmsAbvGrd+1);
Fireplacesl=log(Fireplaces+1);
GarageYrBltl=log(GarageYrBlt+1);
GarageCarsl=log(GarageCars+1);
GarageAreal=log(GarageArea+1);
WoodDeckSFl=log(WoodDeckSF+1);
OpenPorchSFl=log(OpenPorchSF+1);
EnclosedPorchl=log(EnclosedPorch+1);
X3SsnPorchl=log(X3SsnPorch+1);
ScreenPorchl=log(ScreenPorch+1);
PoolAreal=log(PoolArea+1);
MiscVall=log(MiscVal+1);
MoSoldl=log(MoSold+1);
YrSoldl=log(YrSold+1);
SalePricel=log(SalePrice+1);
run;

proc sgscatter data=totalfull2;
matrix SalePricel MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull2;
matrix SalePricel YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull2;
matrix SalePricel BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull2;
matrix SalePricel GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull2;
matrix SalePricel BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull2;
matrix SalePricel GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl / diagonal=(histogram) ;
run;

proc sgscatter data=totalfull2;
matrix SalePricel X3SsnPorchl ScreenPorchl PoolAreal MiscVall MoSoldl YrSoldl / diagonal=(histogram) ;
run;

*forward;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=FORWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = totalforward p = Predict;
run; quit;
ods graphics off;

data totalforward2; set totalforward;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=FORWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = totalforwardCV p = Predict;
run; quit;
ods graphics off;

data totalforwardCV2; set totalforwardCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*BACKWARD;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=BACKWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = totalbackward p = Predict;
run; quit;
ods graphics off;

data totalbackward2; set totalbackward;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=BACKWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = totalbackwardCV p = Predict;
run; quit;
ods graphics off;

data totalbackwardCV2; set totalbackwardCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*STEPWISE;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=stepwise(choose=CV stop=AIC) CVdetails showpvalues;
output out = totalstepwise p = Predict;
run; quit;
ods graphics off;

data totalstepwise2; set totalstepwise;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=stepwise(choose=CV stop=AIC) CVdetails showpvalues;
output out = totalstepwiseCV p = Predict;
run; quit;
ods graphics off;

data totalstepwiseCV2; set totalstepwiseCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*LAR;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=lar(choose=CV stop=AIC) CVdetails showpvalues;
output out = totallar p = Predict;
run; quit;
ods graphics off;

data totallar2; set totallar;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=lar(choose=CV stop=AIC) CVdetails showpvalues;
output out = totallarCV p = Predict;
run; quit;
ods graphics off;

data totallarCV2; set totallarCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*LASSO;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=lasso(choose=CV stop=AIC) CVdetails showpvalues;
output out = totallasso p = Predict;
run; quit;
ods graphics off;

data totallasso2; set totallasso;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=totalfull2 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / selection=lasso(choose=CV stop=AIC) CVdetails showpvalues;
output out = totallassoCV p = Predict;
run; quit;
ods graphics off;

data totallassoCV2; set totallassoCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*proc reg from winner;

data totalfull3;
set totalfull2;
dumBE1=(BsmtExposure='1');
dumBE2=(BsmtExposure='2');
dumBE3=(BsmtExposure='3');
dumBE4=(BsmtExposure='4');
dumBF1=(BsmtFinType1='1');
dumBF2=(BsmtFinType1='2');
dumBF3=(BsmtFinType1='3');
dumBF4=(BsmtFinType1='4');
dumBF5=(BsmtFinType1='5');
dumBF6=(BsmtFinType1='6');
dumEx=(HeatingQC='Ex');
dumFa=(HeatingQC='Fa');
dumGd=(HeatingQC='Gd');
dumPo=(HeatingQC='Po');
dumK1=(KitchenQual='1');
dumK2=(KitchenQual='2');
dumK3=(KitchenQual='3');
dumBlmngtn=(Neighborhood='Blmngtn');
dumBlueste=(Neighborhood='Blueste');
dumBrDale=(Neighborhood='BrDale');
dumBrkSide=(Neighborhood='BrkSide');
dumClearCr=(Neighborhood='ClearCr');
dumCollgCr=(Neighborhood='CollgCr');
dumCrawfor=(Neighborhood='Crawfor');
dumEdwards=(Neighborhood='Edwards');
dumGilbert=(Neighborhood='Gilbert');
dumIDOTRR=(Neighborhood='IDOTRR');
dumMeadowV=(Neighborhood='MeadowV');
dumMitchel=(Neighborhood='Mitchel');
dumNAmes=(Neighborhood='NAmes');
dumNPkVill=(Neighborhood='NPkVill');
dumNWAmes=(Neighborhood='NWAmes');
dumNoRidge=(Neighborhood='NoRidge');
dumNridgHt=(Neighborhood='NridgHt');
dumOldTown=(Neighborhood='OldTown');
dumSWISU=(Neighborhood='SWISU');
dumSawyer=(Neighborhood='Sawyer');
dumSawyerW=(Neighborhood='SawyerW');
dumSomerst=(Neighborhood='Somerst');
dumStoneBr=(Neighborhood='StoneBr');
dumTimber=(Neighborhood='Timber');
dumClyTile=(RoofMatl='ClyTile');
dumCompShg=(RoofMatl='CompShg');
dumMembran=(RoofMatl='Membran');
dumMetal=(RoofMatl='Metal');
dumRoll=(RoofMatl='Roll');
dumTarGrv=(RoofMatl='Tar&Grv');
dumWdShake=(RoofMatl='WdShake');
dumAbnorml=(SaleCondition='Abnorml');
dumAdjLand=(SaleCondition='AdjLand');
dumAlloca=(SaleCondition='Alloca');
dumFamily=(SaleCondition='Family');
dumNormal=(SaleCondition='Normal');
dumGrvl=(Street='Grvl');
run;

ods graphics on ;
proc reg data = totalfull3 outest=totalfullres plots(label) = (rstudentbyleverage cooksd)  ;
model SalePricel = BsmtFinSF1l BsmtFullBathl Fireplacesl GarageCarsl GarageYrBltl GrLivAreal KitchenAbvGrl LotAreal MSSubClassl OverallCondl OverallQuall ScreenPorchl TotalBsmtSFl YearBuiltl dumBE1 dumBE2 dumBE3 dumBE4 dumBF1 dumBF2 dumBF3 dumBF4 dumBF5 dumBF6 dumEx dumFa dumGd dumPo dumK1 dumK2 dumK3 dumBlmngtn dumBlueste dumBrDale dumBrkSide dumClearCr dumCollgCr dumCrawfor dumEdwards dumGilbert dumIDOTRR dumMeadowV dumMitchel dumNAmes dumNPkVill dumNWAmes dumNoRidge dumNridgHt dumOldTown dumSWISU dumSawyer dumSawyerW dumSomerst dumStoneBr dumTimber dumClyTile dumCompShg dumMembran dumMetal dumRoll dumTarGrv dumWdShake dumAbnorml dumAdjLand dumAlloca dumFamily dumNormal dumGrvl / AIC VIF ;
output out = totalfullreg predicted= Predict;
run; quit;
ods graphics off;

data totalfullreg2; set totalfullreg;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*remove insig;

ods graphics on ;
proc reg data = totalfull3 outest=totalfullres plots(label) = (rstudentbyleverage cooksd)  ;
model SalePricel = BsmtFinSF1l BsmtFullBathl Fireplacesl GarageCarsl GarageYrBltl GrLivAreal KitchenAbvGrl LotAreal MSSubClassl OverallCondl OverallQuall ScreenPorchl TotalBsmtSFl YearBuiltl dumBF1 dumBF2 dumBF3 dumEx dumGd dumPo dumK1 dumK2 dumCrawfor dumEdwards dumIDOTRR dumMeadowV dumNoRidge dumNridgHt dumSomerst dumStoneBr dumClyTile dumCompShg dumTarGrv dumWdShake dumAbnorml dumFamily dumNormal dumGrvl / AIC VIF ;
output out = totalsigreg predicted= Predict;
run; quit;
ods graphics off;

data totalsigreg2; set totalsigreg;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

data totalfull4;
set totalfull2;
dumBE1=(BsmtExposure='1');
dumBE2=(BsmtExposure='2');
dumBE3=(BsmtExposure='3');
dumBE4=(BsmtExposure='4');
dumBF1=(BsmtFinType1='1');
dumBF2=(BsmtFinType1='2');
dumBF3=(BsmtFinType1='3');
dumBF4=(BsmtFinType1='4');
dumBF5=(BsmtFinType1='5');
dumBF6=(BsmtFinType1='6');
dumHEx=(HeatingQC='Ex');
dumHFa=(HeatingQC='Fa');
dumHGd=(HeatingQC='Gd');
dumHPo=(HeatingQC='Po');
dumK1=(KitchenQual='1');
dumK2=(KitchenQual='2');
dumK3=(KitchenQual='3');
dumBlmngtn=(Neighborhood='Blmngtn');
dumBlueste=(Neighborhood='Blueste');
dumBrDale=(Neighborhood='BrDale');
dumBrkSide=(Neighborhood='BrkSide');
dumClearCr=(Neighborhood='ClearCr');
dumCollgCr=(Neighborhood='CollgCr');
dumCrawfor=(Neighborhood='Crawfor');
dumEdwards=(Neighborhood='Edwards');
dumGilbert=(Neighborhood='Gilbert');
dumIDOTRR=(Neighborhood='IDOTRR');
dumMeadowV=(Neighborhood='MeadowV');
dumMitchel=(Neighborhood='Mitchel');
dumNAmes=(Neighborhood='NAmes');
dumNPkVill=(Neighborhood='NPkVill');
dumNWAmes=(Neighborhood='NWAmes');
dumNoRidge=(Neighborhood='NoRidge');
dumNridgHt=(Neighborhood='NridgHt');
dumOldTown=(Neighborhood='OldTown');
dumSWISU=(Neighborhood='SWISU');
dumSawyer=(Neighborhood='Sawyer');
dumSawyerW=(Neighborhood='SawyerW');
dumSomerst=(Neighborhood='Somerst');
dumStoneBr=(Neighborhood='StoneBr');
dumTimber=(Neighborhood='Timber');
dumClyTile=(RoofMatl='ClyTile');
dumCompShg=(RoofMatl='CompShg');
dumMembran=(RoofMatl='Membran');
dumMetal=(RoofMatl='Metal');
dumRoll=(RoofMatl='Roll');
dumTarGrv=(RoofMatl='TarGrv');
dumWdShake=(RoofMatl='WdShake');
dumAbnorml=(SaleCondition='Abnorml');
dumAdjLand=(SaleCondition='AdjLand');
dumAlloca=(SaleCondition='Alloca');
dumFamily=(SaleCondition='Family');
dumNormal=(SaleCondition='Normal');
dumGrvl=(Street='Grvl');
dumBQ1=(BsmtQual='1');
dumBQ2=(BsmtQual='2');
dumBQ3=(BsmtQual='3');
dumBQ4=(BsmtQual='4');
dumBQ5=(BsmtQual='5');
dumCN=(CentralAir='N');
dumCEx=(ExterCond='Ex');
dumCFa=(ExterCond='Fa');
dumCGd=(ExterCond='Gd');
dumCPo=(ExterCond='Po');
dumF1=(Functional='1');
dumF2=(Functional='2');
dumF3=(Functional='3');
dumF4=(Functional='4');
dumF5=(Functional='5');
dumF6=(Functional='6');
dumF7=(Functional='7');
dumM1=(MiscFeature='1');
dumM2=(MiscFeature='2');
dumM3=(MiscFeature='3');
dumM4=(MiscFeature='4');
dumM5=(MiscFeature='5');
dumPN=(PavedDrive='N');
dumPP=(PavedDrive='P');
dumU1=(Utilities='1');
dumU2=(Utilities='2');
dumU3=(Utilities='3');
run;

*aic;

ods graphics on ;
proc reg data = totalfull4 outest=totalfullres plots(label) = (rstudentbyleverage cooksd)  ;
model SalePricel = BedroomAbvGrl BsmtFinSF1l BsmtFullBathl BsmtUnfSFl EnclosedPorchl Fireplacesl FullBathl GarageAreal GarageCarsl GarageYrBltl GrLivAreal HalfBathl KitchenAbvGrl LotAreal MiscVall MSSubClassl OverallCondl OverallQuall PoolAreal ScreenPorchl TotalBsmtSFl WoodDeckSFl X1stFlrSFl X2ndFlrSFl YearBuiltl YearRemodAddl dumBE1 dumBE2 dumBE3 dumBE4 dumBF1 dumBF2 dumBF3 dumBF4 dumBF5 dumBF6 dumHEx dumHFa dumHGd dumHPo dumK1 dumK2 dumK3 dumBlmngtn dumBlueste dumBrDale dumBrkSide dumClearCr dumCollgCr dumCrawfor dumEdwards dumGilbert dumIDOTRR dumMeadowV dumMitchel dumNAmes dumNPkVill dumNWAmes dumNoRidge dumNridgHt dumOldTown dumSWISU dumSawyer dumSawyerW dumSomerst dumStoneBr dumTimber dumClyTile dumCompShg dumMembran dumMetal dumRoll dumTarGrv dumWdShake dumAbnorml dumAdjLand dumAlloca dumFamily dumNormal dumGrvl dumBQ1 dumBQ2 dumBQ3 dumBQ4 dumBQ5 dumCN dumCEx dumCFa dumCGd dumCPo dumF1 dumF2 dumF3 dumF4 dumF5 dumF6 dumF7 dumM1 dumM2 dumM3 dumM4 dumM5 dumPN dumPP dumU1 dumU2 dumU3/ AIC VIF  ;
output out = totalaicreg predicted= Predict;
run; quit;
ods graphics off;

data totalaicreg2; set totalaicreg;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glm data=totalfull2;
class  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType RoofStyle RoofMatl Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleCondition;
model SalePricel =  MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl MasVnrAreal BsmtFinSF1l BsmtFinSF2l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl X2ndFlrSFl LowQualFinSFl GrLivAreal BsmtFullBathl BsmtHalfBathl FullBathl HalfBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal WoodDeckSFl OpenPorchSFl EnclosedPorchl X3SsnPorchl ScreenPorchl PoolAreal MiscVall / solution;
output out = totalbackwardglm p = Predict;
run; quit;
ods graphics off;

data totalbackwardglm2; set totalbackwardglm;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;