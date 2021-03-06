USE AdventureworksDW2016CTP3;
GO

SELECT  ProductKey ,
        ProductAlternateKey ,
        ProductSubcategoryKey ,
        WeightUnitMeasureCode ,
        SizeUnitMeasureCode ,
        EnglishProductName ,
        SpanishProductName ,
        FrenchProductName ,
        StandardCost ,
        FinishedGoodsFlag ,
		Status,
        Color ,
		DENSE_RANK() OVER (PARTITION BY Status ORDER BY Color ) AS ColorDenseRank ,
        RANK() OVER (PARTITION BY Status ORDER BY Color ) AS ColorRank ,
        SafetyStockLevel ,
        ReorderPoint ,
        ListPrice ,
        Size ,
        SizeRange ,
        Weight ,
        DaysToManufacture ,
        ProductLine ,
        DealerPrice ,
        Class ,
        Style ,
        ModelName ,
        LargePhoto ,
        EnglishDescription ,
        FrenchDescription ,
        ChineseDescription ,
        ArabicDescription ,
        HebrewDescription ,
        ThaiDescription ,
        GermanDescription ,
        JapaneseDescription ,
        TurkishDescription ,
        StartDate ,
        EndDate 
FROM    dbo.DimProduct;


SELECT  ProductKey ,
		Color,
        ProductAlternateKey ,
		DENSE_RANK() OVER (PARTITION BY Color ORDER BY ProductAlternateKey ) AS ProductAlternateKeyDenseRank ,
		RANK() OVER (PARTITION BY Color ORDER BY ProductAlternateKey ) AS ProductAlternateKeyRank ,
        ProductSubcategoryKey ,
        WeightUnitMeasureCode ,
        SizeUnitMeasureCode ,
        EnglishProductName ,
        SpanishProductName ,
        FrenchProductName ,
        StandardCost ,
        FinishedGoodsFlag ,
        SafetyStockLevel ,
        ReorderPoint ,
        ListPrice ,
        Size ,
        SizeRange ,
        Weight ,
        DaysToManufacture ,
        ProductLine ,
        DealerPrice ,
        Class ,
        Style ,
        ModelName ,
        LargePhoto ,
        EnglishDescription ,
        FrenchDescription ,
        ChineseDescription ,
        ArabicDescription ,
        HebrewDescription ,
        ThaiDescription ,
        GermanDescription ,
        JapaneseDescription ,
        TurkishDescription ,
        StartDate ,
        EndDate ,
        Status
FROM    dbo.DimProduct;


SELECT  ProductKey ,
        ProductAlternateKey ,
        ProductSubcategoryKey ,
        WeightUnitMeasureCode ,
        SizeUnitMeasureCode ,
		Color,
        EnglishProductName ,
		DENSE_RANK() OVER (PARTITION BY Color ORDER BY EnglishProductName desc) AS EnglishProductNameDenseRank,   
		RANK() OVER (PARTITION BY Color ORDER BY EnglishProductName desc) AS EnglishProductNameRank,        
		SpanishProductName ,
        FrenchProductName ,
        StandardCost ,
        FinishedGoodsFlag ,
        Color ,
        SafetyStockLevel ,
        ReorderPoint ,
        ListPrice ,
        Size ,
        SizeRange ,
        Weight ,
        DaysToManufacture ,
        ProductLine ,
        DealerPrice ,
        Class ,
        Style ,
        ModelName ,
        LargePhoto ,
        EnglishDescription ,
        FrenchDescription ,
        ChineseDescription ,
        ArabicDescription ,
        HebrewDescription ,
        ThaiDescription ,
        GermanDescription ,
        JapaneseDescription ,
        TurkishDescription ,
        StartDate ,
        EndDate ,
        Status
FROM    dbo.DimProduct;

SELECT  ProductKey ,
        ProductSubcategoryKey ,
        WeightUnitMeasureCode ,
        SizeUnitMeasureCode ,
        EnglishProductName ,
        SpanishProductName ,
        FrenchProductName ,
        StandardCost ,
        FinishedGoodsFlag ,
		Status,
        Color ,
        ProductAlternateKey ,
		DENSE_RANK() OVER (PARTITION BY Status ORDER BY Color, ProductAlternateKey ) AS ColorProductDenseRank ,
        RANK() OVER (PARTITION BY Status ORDER BY Color, ProductAlternateKey ) AS ColorProductRank ,
        SafetyStockLevel ,
        ReorderPoint ,
        ListPrice ,
        Size ,
        SizeRange ,
        Weight ,
        DaysToManufacture ,
        ProductLine ,
        DealerPrice ,
        Class ,
        Style ,
        ModelName ,
        LargePhoto ,
        EnglishDescription ,
        FrenchDescription ,
        ChineseDescription ,
        ArabicDescription ,
        HebrewDescription ,
        ThaiDescription ,
        GermanDescription ,
        JapaneseDescription ,
        TurkishDescription ,
        StartDate ,
        EndDate 
FROM    dbo.DimProduct;