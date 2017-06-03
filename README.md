# iowa-housing
I included the R code on imputation

change directories on lines 1, 3 and 10...I combined both train and test data sets for more power on sample size

in a nutshell, not ALL NA's are NA's

in data_description, there are sometimes where NA is used because the garage or swimming pool is actually not there and not missing, but SAS is dumb and treats NA as if they are actually missing values and skips the calculation in the MLR

so, to trick the SAS system into reading the N/As as an actual category, another category has to be created

so, the R code is pretty straightforward..I didn't write any functions because I'm not that good w/ sapply yet

there's dozens of ways to imputate but I stuck with bootstrap because it could be cited as an adequate resource when McGee used it.

you can't imputate categorical values unless they are turned into numerical, but the way I did this was to change all the categorical to the order in which the data description orders it...read the data description file on the categorical orders

I did not change the categories back to their categorical names and instead kept it as numerical. If a column is non missing, I left them as char, but if they have missing values, I changed everything to numerical

Just remember to have those numbers as a class instead of a number

let me know if that makes any sense

totalfull, total75, total50 are the full imputated tables with both train and test together

totalfull is then split into trainfull and testfull. If you want to use the trainfull to make a model by automated selection, do it

However, because of imputated data, all the columns are artificially complete

to combat that, total75 only includes the columns that originally have 75%+ completed data

total50 only includes the columns that originally have 50%+ completed data

refer to raw key total to figure out which imputated data were originally categorical and which ones were ints

===

for the fulldata

the ints

MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF X1stFlrSF X2ndFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch X3SsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice

the classes

MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition

for imp50 threshold

the ints

MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd BsmtFinSF1 BsmtUnfSF TotalBsmtSF X1stFlrSF GrLivArea FullBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars GarageArea OpenPorchSF MoSold YrSold SalePrice

the classes

MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional FireplaceQu GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition

for imp75 threshold

the ints

MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd BsmtUnfSF TotalBsmtSF X1stFlrSF GrLivArea FullBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd GarageYrBlt GarageCars GarageArea MoSold YrSold SalePrice

the classes

MSZoning Street LotShape LandContour Utilities LotConfig LandSlope Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle RoofMatl Exterior1st Exterior2nd MasVnrType ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual Functional GarageType GarageFinish GarageQual GarageCond PavedDrive SaleType SaleCondition

===

then from the 2:3:5 CV:test:train split for the training set, build a model based on logging salesprice and lotarea and a bunch of other fancy stuff using forward, backwards, stepwise selection on the test set

get the best kaggle score and report findings, done


