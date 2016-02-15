USE AdventureworksDW2016CTP3;
GO
SELECT  [ProductKey] ,
        [ProductAlternateKey] ,
        [ProductSubcategoryKey] ,
        [WeightUnitMeasureCode] ,
        [SizeUnitMeasureCode] ,
        [EnglishProductName] ,
        [SpanishProductName] ,
        [FrenchProductName] ,
        [StandardCost] ,
        [FinishedGoodsFlag] ,
        [Color] ,
        [SafetyStockLevel] ,
        LAG(SafetyStockLevel) OVER ( ORDER BY Color, SafetyStockLevel ) AS Lag ,
        LEAD(SafetyStockLevel) OVER ( ORDER BY Color, SafetyStockLevel ) AS Lead ,
        [ReorderPoint] ,
        [ListPrice] ,
        [Size] ,
        [SizeRange] ,
        [Weight] ,
        [DaysToManufacture] ,
        [ProductLine] ,
        [DealerPrice] ,
        [Class] ,
        [Style] ,
        [ModelName] ,
        [LargePhoto] ,
        [EnglishDescription] ,
        [FrenchDescription] ,
        [ChineseDescription] ,
        [ArabicDescription] ,
        [HebrewDescription] ,
        [ThaiDescription] ,
        [GermanDescription] ,
        [JapaneseDescription] ,
        [TurkishDescription] ,
        [StartDate] ,
        [EndDate] ,
        [Status]
FROM    [dbo].[DimProduct];


SELECT  [ProductKey] ,
        [ProductAlternateKey] ,
        [ProductSubcategoryKey] ,
        [WeightUnitMeasureCode] ,
        [SizeUnitMeasureCode] ,
        [EnglishProductName] ,
        [SpanishProductName] ,
        [FrenchProductName] ,
        [StandardCost] ,
        [FinishedGoodsFlag] ,
        [Color] ,
        [SafetyStockLevel] ,
        FIRST_VALUE(SafetyStockLevel) OVER ( ORDER BY Color, SafetyStockLevel ) AS FirstValue ,
        LAST_VALUE(SafetyStockLevel) OVER ( ORDER BY Color, SafetyStockLevel ) AS LastValue ,
        [ReorderPoint] ,
        [ListPrice] ,
        [Size] ,
        [SizeRange] ,
        [Weight] ,
        [DaysToManufacture] ,
        [ProductLine] ,
        [DealerPrice] ,
        [Class] ,
        [Style] ,
        [ModelName] ,
        [LargePhoto] ,
        [EnglishDescription] ,
        [FrenchDescription] ,
        [ChineseDescription] ,
        [ArabicDescription] ,
        [HebrewDescription] ,
        [ThaiDescription] ,
        [GermanDescription] ,
        [JapaneseDescription] ,
        [TurkishDescription] ,
        [StartDate] ,
        [EndDate] ,
        [Status]
FROM    [dbo].[DimProduct];



SELECT  [ProductKey] ,
        [ProductAlternateKey] ,
        [ProductSubcategoryKey] ,
        [WeightUnitMeasureCode] ,
        [SizeUnitMeasureCode] ,
        [EnglishProductName] ,
        [SpanishProductName] ,
        [FrenchProductName] ,
        [Color] ,
        [SafetyStockLevel] ,
        [StandardCost] ,
        PERCENT_RANK() OVER ( ORDER BY Color, SafetyStockLevel ) AS PercentRank ,
        CUME_DIST() OVER ( ORDER BY Color, SafetyStockLevel ) AS CumulativeDistribution ,
        [FinishedGoodsFlag] ,
        [ReorderPoint] ,
        [ListPrice] ,
        [Size] ,
        [SizeRange] ,
        [Weight] ,
        [DaysToManufacture] ,
        [ProductLine] ,
        [DealerPrice] ,
        [Class] ,
        [Style] ,
        [ModelName] ,
        [LargePhoto] ,
        [EnglishDescription] ,
        [FrenchDescription] ,
        [ChineseDescription] ,
        [ArabicDescription] ,
        [HebrewDescription] ,
        [ThaiDescription] ,
        [GermanDescription] ,
        [JapaneseDescription] ,
        [TurkishDescription] ,
        [StartDate] ,
        [EndDate] ,
        [Status]
FROM    [dbo].[DimProduct]
WHERE   StandardCost > 0;

-- percent cont = interpolated
-- percent disc = exact
SELECT  [ProductKey] ,
        [ProductAlternateKey] ,
        [ProductSubcategoryKey] ,
        [WeightUnitMeasureCode] ,
        [SizeUnitMeasureCode] ,
        [EnglishProductName] ,
        [SpanishProductName] ,
        [FrenchProductName] ,
        [Color] ,
        [SafetyStockLevel] ,
        [StandardCost] ,
        PERCENTILE_CONT(.50) WITHIN GROUP ( ORDER BY [StandardCost] ) OVER(PARTITION BY Color, SafetyStockLevel) AS Percent50Cont ,
        PERCENTILE_DISC(.50) WITHIN GROUP ( ORDER BY [StandardCost] ) OVER(PARTITION BY Color, SafetyStockLevel) AS Percent50Disc ,
        [FinishedGoodsFlag] ,
        [ReorderPoint] ,
        [ListPrice] ,
        [Size] ,
        [SizeRange] ,
        [Weight] ,
        [DaysToManufacture] ,
        [ProductLine] ,
        [DealerPrice] ,
        [Class] ,
        [Style] ,
        [ModelName] ,
        [LargePhoto] ,
        [EnglishDescription] ,
        [FrenchDescription] ,
        [ChineseDescription] ,
        [ArabicDescription] ,
        [HebrewDescription] ,
        [ThaiDescription] ,
        [GermanDescription] ,
        [JapaneseDescription] ,
        [TurkishDescription] ,
        [StartDate] ,
        [EndDate] ,
        [Status]
FROM    [dbo].[DimProduct]
WHERE   StandardCost > 0;