FILENAME REFFILE '/home/yaoy890/proj 1/total75.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=imp75;
	GETNAMES=YES;
RUN;

proc sgscatter data=imp75;
matrix SalePrice MSSubClass LotFrontage LotArea OverallQual OverallCond / diagonal=(histogram) ;
run;

proc sgscatter data=imp75;
matrix SalePrice YearBuilt YearRemodAdd BsmtUnfSF TotalBsmtSF X1stFlrSF / diagonal=(histogram) ;
run;

proc sgscatter data=imp75;
matrix SalePrice GrLivArea FullBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd / diagonal=(histogram) ;
run;

proc sgscatter data=imp75;
matrix SalePrice GarageYrBlt GarageCars GarageArea MoSold YrSold / diagonal=(histogram) ;
run;

data imp752;
set imp75;
MSSubClassl=log(MSSubClass+1);
LotFrontagel=log(LotFrontage+1);
LotAreal=log(LotArea+1);
OverallQuall=log(OverallQual+1);
OverallCondl=log(OverallCond+1);
YearBuiltl=log(YearBuilt+1);
YearRemodAddl=log(YearRemodAdd+1);
BsmtUnfSFl=log(BsmtUnfSF+1);
TotalBsmtSFl=log(TotalBsmtSF+1);
X1stFlrSFl=log(X1stFlrSF+1);
GrLivAreal=log(GrLivArea+1);
FullBathl=log(FullBath+1);
BedroomAbvGrl=log(BedroomAbvGr+1);
KitchenAbvGrl=log(KitchenAbvGr+1);
TotRmsAbvGrdl=log(TotRmsAbvGrd+1);
GarageYrBltl=log(GarageYrBlt+1);
GarageCarsl=log(GarageCars+1);
GarageAreal=log(GarageArea+1);
MoSoldl=log(MoSold+1);
YrSoldl=log(YrSold+1);
SalePricel=log(SalePrice+1);
run;

proc sgscatter data=imp752;
matrix SalePricel MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl / diagonal=(histogram) ;
run;

proc sgscatter data=imp752;
matrix SalePricel YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl / diagonal=(histogram) ;
run;

proc sgscatter data=imp752;
matrix SalePricel GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl / diagonal=(histogram) ;
run;

proc sgscatter data=imp752;
matrix SalePricel GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / diagonal=(histogram) ;
run;

*forward;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=FORWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75forward p = Predict;
run; quit;
ods graphics off;

data imp75forward2; set imp75forward;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=FORWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75forwardCV p = Predict;
run; quit;
ods graphics off;

data imp75forwardCV2; set imp75forwardCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*BACKWARD;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=BACKWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75backward p = Predict;
run; quit;
ods graphics off;

data imp75backward2; set imp75backward;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=BACKWARD(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75backwardCV p = Predict;
run; quit;
ods graphics off;

data imp75backwardCV2; set imp75backwardCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*STEPWISE;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=STEPWISE(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75stepwise p = Predict;
run; quit;
ods graphics off;

data imp75stepwise2; set imp75stepwise;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=STEPWISE(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75stepwiseCV p = Predict;
run; quit;
ods graphics off;

data imp75stepwiseCV2; set imp75stepwiseCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*LAR;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=LAR(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75lar p = Predict;
run; quit;
ods graphics off;

data imp75lar2; set imp75lar;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=LAR(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75larCV p = Predict;
run; quit;
ods graphics off;

data imp75larCV2; set imp75larCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

*LASSO;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
partition fraction(validate = 0.3 test = 0.2);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=LASSO(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75lasso p = Predict;
run; quit;
ods graphics off;

data imp75lasso2; set imp75lasso;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;

ods graphics on;
proc glmselect data=imp752 seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot ASE);
class MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition;
model SalePricel = MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition MSSubClassl LotFrontagel LotAreal OverallQuall OverallCondl YearBuiltl YearRemodAddl BsmtUnfSFl TotalBsmtSFl X1stFlrSFl GrLivAreal FullBathl BedroomAbvGrl KitchenAbvGrl TotRmsAbvGrdl GarageYrBltl GarageCarsl GarageAreal MoSoldl YrSoldl / selection=LASSO(choose=CV stop=AIC) CVdetails showpvalues;
output out = imp75lassoCV p = Predict;
run; quit;
ods graphics off;

data imp75lassoCV2; set imp75lassoCV;
SalePrice = exp(Predict)-1;
keep id SalePrice;
where id > 1460;
;