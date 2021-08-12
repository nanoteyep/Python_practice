SELECT
    A.MM,
    A.RANGE
FROM
    (
        SELECT 
            SUBSTR(A.STD_DE, 6, 2) AS MM,
            ROUND(AVG(A.MAX_TEMPER - A.MIN_TEMPER), 2) AS RANGE
        FROM TB_TEMPER_DATA A
        WHERE A.AREA_CD = '108' -- 서울을 나타내는 지역코드, 사실 데이터 자체가 서울시의 온도이기 때문에 별 의미는 없습니다.
        GROUP BY SUBSTR(A.STD_DE, 6, 2)
        ORDER BY RANGE DESC
    ) A
WHERE ROWNUM <= 1; -- 가장 첫 부분만 보여주게 합니다.


SELECT
    A.DAY,
    A.RANGE,
    A.MAX_TEMPER,
    A.MIN_TEMPER

FROM
    (
        SELECT 
            A.STD_DE AS DAY,
            A.MAX_TEMPER - A.MIN_TEMPER AS RANGE,
            A.MAX_TEMPER,
            A.MIN_TEMPER
        
        FROM TB_TEMPER_DATA A
        
        WHERE A.AREA_CD = '108'
        AND A.MAX_TEMPER IS NOT NULL
        AND A.MIN_TEMPER IS NOT NULL
        
        ORDER BY RANGE DESC
    ) A

WHERE ROWNUM <= 1;

SELECT
    SUBSTR(A.STD_DE, 1, 4) AS YYYY,
    ROUND(AVG(AVG_TEMPER), 2) AS AVG_TEMPER

FROM TB_TEMPER_DATA A

GROUP BY SUBSTR(A.STD_DE, 1, 4)
ORDER BY YYYY ASC;

SELECT
    CASE
    WHEN YYYY BETWEEN '1900' AND '1909' THEN '1900년대' WHEN YYYY BETWEEN '1910' AND '1919' THEN '1910년대'
    WHEN YYYY BETWEEN '1920' AND '1929' THEN '1920년대' WHEN YYYY BETWEEN '1930' AND '1939' THEN '1930년대'
    WHEN YYYY BETWEEN '1940' AND '1949' THEN '1940년대' WHEN YYYY BETWEEN '1950' AND '1959' THEN '1950년대'
    WHEN YYYY BETWEEN '1960' AND '1969' THEN '1960년대' WHEN YYYY BETWEEN '1970' AND '1979' THEN '1970년대'
    WHEN YYYY BETWEEN '1980' AND '1989' THEN '1980년대' WHEN YYYY BETWEEN '1990' AND '1999' THEN '1990년대'
    WHEN YYYY BETWEEN '2000' AND '2009' THEN '2000년대' WHEN YYYY BETWEEN '2010' AND '2019' THEN '2010년대'
    WHEN YYYY BETWEEN '2020' AND '2029' THEN '2020년대' END AS AGE,
    ROUND(AVG(AVG_TEMPER), 2) AS AVG_TEMPER
    
FROM
    (
        SELECT
        SUBSTR(A.STD_DE, 1, 4) AS YYYY,
        ROUND(AVG(AVG_TEMPER), 2) AS AVG_TEMPER
        
        FROM TB_TEMPER_DATA A
        
        GROUP BY SUBSTR(A.STD_DE, 1, 4)
        ORDER BY YYYY
    )
    
GROUP BY
    CASE
    WHEN YYYY BETWEEN '1900' AND '1909' THEN '1900년대' WHEN YYYY BETWEEN '1910' AND '1919' THEN '1910년대'
    WHEN YYYY BETWEEN '1920' AND '1929' THEN '1920년대' WHEN YYYY BETWEEN '1930' AND '1939' THEN '1930년대'
    WHEN YYYY BETWEEN '1940' AND '1949' THEN '1940년대' WHEN YYYY BETWEEN '1950' AND '1959' THEN '1950년대'
    WHEN YYYY BETWEEN '1960' AND '1969' THEN '1960년대' WHEN YYYY BETWEEN '1970' AND '1979' THEN '1970년대'
    WHEN YYYY BETWEEN '1980' AND '1989' THEN '1980년대' WHEN YYYY BETWEEN '1990' AND '1999' THEN '1990년대'
    WHEN YYYY BETWEEN '2000' AND '2009' THEN '2000년대' WHEN YYYY BETWEEN '2010' AND '2019' THEN '2010년대'
    WHEN YYYY BETWEEN '2020' AND '2029' THEN '2020년대' END
ORDER BY AGE;