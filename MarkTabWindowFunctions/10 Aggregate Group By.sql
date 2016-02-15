USE AdventureworksDW2016CTP3;
GO


SELECT  [Color] ,
        MAX(SafetyStockLevel) OVER ( PARTITION BY Color ) AS MaxSafetyPartitionByColor ,
        MIN(SafetyStockLevel) OVER ( PARTITION BY Color ) AS MinSafetyPartitionByColor ,
        AVG(SafetyStockLevel) OVER ( PARTITION BY Color ) AS AvgSafetyPartitionByColor ,
        SUM(SafetyStockLevel) OVER ( PARTITION BY Color ) AS SumSafetyPartitionByColor ,
        COUNT(SafetyStockLevel) OVER ( PARTITION BY Color ) AS CountSafetyPartitionByColor ,
        STDEV(SafetyStockLevel) OVER ( PARTITION BY Color ) AS StDevSafetyPartitionByColor ,
        STDEVP(SafetyStockLevel) OVER ( PARTITION BY Color ) AS StDevPSafetyPartitionByColor ,
        VAR(SafetyStockLevel) OVER ( PARTITION BY Color ) AS VarSafetyPartitionByColor ,
        VARP(SafetyStockLevel) OVER ( PARTITION BY Color ) AS VarPSafetyPartitionByColor
FROM    [dbo].[DimProduct]
GROUP BY Color;


SELECT  [Color] ,
        COUNT([SafetyStockLevel]) AS Count ,
        COUNT(COUNT([SafetyStockLevel])) OVER ( ) AS CountOfCounts
FROM    [dbo].[DimProduct]
GROUP BY Color;


SELECT  [Color] ,
        SUM([SafetyStockLevel]) AS Sum ,
        SUM(SUM([SafetyStockLevel])) OVER ( ) AS SumOfSums
FROM    [dbo].[DimProduct]
GROUP BY Color;

SELECT  [Color] ,
        SUM([SafetyStockLevel]) AS Sum ,
        COUNT(SUM([SafetyStockLevel])) OVER ( ) AS CountOfSums
FROM    [dbo].[DimProduct]
GROUP BY Color;

SELECT  [Color] ,
        SUM([SafetyStockLevel]) AS Sum ,
        AVG(SUM([SafetyStockLevel])) OVER ( ) AS AvgOfSums
FROM    [dbo].[DimProduct]
GROUP BY Color;



SELECT  [Color] ,
        SUM([SafetyStockLevel]) AS Sum ,
        RANK() OVER ( ORDER BY SUM([SafetyStockLevel]) ) AS RankOfSums
FROM    [dbo].[DimProduct]
GROUP BY Color;

SELECT  [Color] ,
        AVG([SafetyStockLevel]) AS Avg ,
        RANK() OVER ( ORDER BY AVG([SafetyStockLevel]) ) AS RankOfAvg,
        SUM([SafetyStockLevel]) AS Sum ,
        RANK() OVER ( ORDER BY SUM([SafetyStockLevel]) ) AS RankOfSums
FROM    [dbo].[DimProduct]
GROUP BY Color;


SELECT  [Color] ,
        AVG([SafetyStockLevel]) AS Avg ,
        RANK() OVER ( ORDER BY AVG([SafetyStockLevel]) ) AS RankOfAvg,
        SUM([SafetyStockLevel]) AS Sum ,
        RANK() OVER ( ORDER BY SUM([SafetyStockLevel]) ) AS RankOfSums,
        COUNT([SafetyStockLevel]) AS Count ,
        RANK() OVER ( ORDER BY COUNT([SafetyStockLevel]) ) AS RankOfCounts
FROM    [dbo].[DimProduct]
GROUP BY Color;


-- How to get rid of the NA?
-- What happens for variance of Grey?

WITH    FirstRound
          AS ( SELECT   [Color] ,
                        AVG([SafetyStockLevel]) AS Avg ,
                        RANK() OVER ( ORDER BY AVG([SafetyStockLevel]) ) AS RankOfAvg ,
                        SUM([SafetyStockLevel]) AS Sum ,
                        RANK() OVER ( ORDER BY SUM([SafetyStockLevel]) ) AS RankOfSums ,
                        COUNT([SafetyStockLevel]) AS Count ,
                        RANK() OVER ( ORDER BY COUNT([SafetyStockLevel]) ) AS RankOfCounts
               FROM     [dbo].[DimProduct]
               GROUP BY Color
             )
    SELECT  FirstRound.Color ,
            FirstRound.Avg ,
            FirstRound.RankOfAvg ,
            FirstRound.Sum ,
            FirstRound.RankOfSums ,
            FirstRound.Count ,
            FirstRound.RankOfCounts ,
            RANK() OVER ( ORDER BY FirstRound.RankOfAvg
                          + FirstRound.RankOfSums + FirstRound.RankOfCounts ) AS OverallRank
    FROM    FirstRound;

