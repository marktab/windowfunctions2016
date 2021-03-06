CREATE TABLE #MarkTabRange(Sales INT);

INSERT  INTO #MarkTabRange
        ( Sales )
VALUES  ( 12 ),
        ( 23 ),
        ( 34 ),
        ( 45 ),
        ( 50 ),
        ( 50 ),
        ( 50 ),
        ( 50 ),
        ( 65 );

SELECT  Sales ,
        COUNT(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Count
FROM    #MarkTabRange;

SELECT  Sales ,
        COUNT(Sales) OVER ( ORDER BY sales RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING ) AS Count
FROM    #MarkTabRange;


SELECT  Sales ,
        COUNT(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Count ,
        MIN(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Min ,
        MAX(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Max ,
        AVG(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Avg ,
        SUM(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Sum ,
        RANK() OVER ( ORDER BY sales ) AS Rank ,
        STDEV(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS StDev ,
        VAR(Sales) OVER ( ORDER BY sales RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) AS Var
FROM    #MarkTabRange;

