
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
		MAX(SafetyStockLevel) OVER () AS MaxSafety1 ,
        MAX(SafetyStockLevel) OVER (order by color rows between unbounded preceding and unbounded following) AS MaxSafety2 ,
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
        MAX(SafetyStockLevel) OVER (ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MaxSafety ,
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
        MAX(SafetyStockLevel) OVER ( ORDER BY Color  ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS MaxSafetyOrderByColor ,
		MAX(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY Color  ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING ) AS MaxSafetyPartitionByColor ,
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
        MAX(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MaxSafetyPartitionByColor ,
        MIN(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MinSafetyPartitionByColor ,
        AVG(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS AvgSafetyPartitionByColor ,
        SUM(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SumSafetyPartitionByColor ,
        COUNT(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CountSafetyPartitionByColor ,
        STDEV(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS StDevSafetyPartitionByColor ,
        STDEVP(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS StDevPSafetyPartitionByColor ,
        VAR(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS VarSafetyPartitionByColor ,
        VARP(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS VarPSafetyPartitionByColor ,
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
        MAX(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) - 
		MIN(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS DiffSafetyPartitionByColor ,
        AVG(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS AvgSafetyPartitionByColor ,
        SUM(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) / 
		COUNT(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SumDivCountSafetyPartitionByColor ,
        [ReorderPoint] ,
        MAX(SafetyStockLevel) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) - 
		MIN(ReorderPoint) OVER ( PARTITION BY Color ORDER BY COLOR, ListPrice ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS DiffSafetyReorderPartitionByColor ,
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


