FILENAME REFFILE '/home/yaoy890/proj 1/total50.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=imp50;
	GETNAMES=YES;
RUN;

proc sgscatter data=imp50;
matrix SalePrice MSSubClass LotFrontage LotArea OverallQual OverallCond  / diagonal=(histogram) ;
run;

proc sgscatter data=imp50;
matrix SalePrice YearBuilt YearRemodAdd BsmtFinSF1 BsmtUnfSF TotalBsmtSF / diagonal=(histogram) ;
run;

proc sgscatter data=imp50;
matrix SalePrice X1stFlrSF GrLivArea FullBath BedroomAbvGr KitchenAbvGr / diagonal=(histogram) ;
run;

proc sgscatter data=imp50;
matrix SalePrice TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars GarageArea OpenPorchSF MoSold YrSold / diagonal=(histogram) ;
run;

data imp502;
set imp50;
SalePricel=log(SalePrice+1);
MSSubClassl=log(MSSubClass+1);
LotFrontagel=log(LotFrontage+1);
LotAreal=log(LotArea+1);
OverallQuall=log(OverallQual+1);
OverallCondl=log(OverallCond+1);
YearBuiltl=log(YearBuilt+1);
YearRemodAddl=log(YearRemodAdd+1);
BsmtFinSF1l=log(BsmtFinSF1+1);
BsmtUnfSFl=log(BsmtUnfSF+1);
TotalBsmtSFl=log(TotalBsmtSF+1);
X1stFlrSFl=log(X1stFlrSF+1);
GrLivAreal=log(GrLivArea+1);
FullBathl=log(FullBath+1);
BedroomAbvGrl=log(BedroomAbvGr+1);
KitchenAbvGrl=log(KitchenAbvGr+1);
TotRmsAbvGrdl=log(TotRmsAbvGrd+1);
Fireplacesl=log(Fireplaces+1);
GarageYrBltl=log(GarageYrBlt+1);
GarageCarsl=log(GarageCars+1);
GarageAreal=log(GarageArea+1);
OpenPorchSFl=log(OpenPorchSF+1);
MoSoldl=log(MoSold+1);
YrSoldl=log(YrSold+1);
run;

proc sgscatter data=imp502;
matrix SalePricel MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl / diagonal=(histogram) ;
run;

proc sgscatter data=imp502;
matrix SalePricel YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl / diagonal=(histogram) ;
run;

proc sgscatter data=imp502;
matrix SalePricel X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl / diagonal=(histogram) ;
run;

proc sgscatter data=imp502;
matrix SalePricel TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / diagonal=(histogram) ;
run;

*forward;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=FORWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50forward p = Predict;
run; quit;
ods graphics off;

data imp50forward2; set imp50forward;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=FORWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50forwardCV p = Predict;
run; quit;
ods graphics off;

data imp50forwardCV2; set imp50forwardCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*BACKWARD;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=BACKWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50backward p = Predict;
run; quit;
ods graphics off;

data imp50backward2; set imp50backward;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=BACKWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50backwardCV p = Predict;
run; quit;
ods graphics off;

data imp50backwardCV2; set imp50backwardCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*STEPWISE;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=STEPWISE(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50stepwise p = Predict;
run; quit;
ods graphics off;

data imp50stepwise2; set imp50stepwise;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=STEPWISE(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50stepwiseCV p = Predict;
run; quit;
ods graphics off;

data imp50stepwiseCV2; set imp50stepwiseCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*LAR;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=LAR(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50lar p = Predict;
run; quit;
ods graphics off;

data imp50lar2; set imp50lar;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=LAR(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50larCV p = Predict;
run; quit;
ods graphics off;

data imp50larCV2; set imp50larCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*LASSO;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=LASSO(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50lasso p = Predict;
run; quit;
ods graphics off;

data imp50lasso2; set imp50lasso;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp502 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtFinSF1l BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl Fireplacesl GarageYrBltl GarageCarsl GarageAreal OpenPorchSFl MoSoldl YrSoldl / selection=LASSO(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp50lassoCV p = Predict;
run; quit;
ods graphics off;

data imp50lassoCV2; set imp50lassoCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;