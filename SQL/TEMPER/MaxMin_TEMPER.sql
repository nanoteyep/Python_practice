SELECT 
        B.STD_DE,
        B.AREA_CD,
        B.MAX_TEMPER,
        B.MIN_TEMPER
    
    FROM
        (
            SELECT
                    SUBSTR(A.STD_DE, 6, 5) AS MMDD,
                    MAX(A.MAX_TEMPER) AS MAX_TEMPER,
                    MIN(A.MIN_TEMPER) AS MIN_TEMPER
                FROM TB_TEMPER_DATA A
                WHERE A.AREA_CD = '108'
                AND A.STD_DE LIKE '_____12-20'
                GROUP BY SUBSTR(A.STD_DE, 6, 5)
            ) A,
            TB_TEMPER_DATA B
    WHERE (B.AREA_CD = '108' AND SUBSTR(B.STD_DE, 6, 5) = A.MMDD  AND B.MAX_TEMPER = A.MAX_TEMPER)
    OR (B.AREA_CD = '108' AND SUBSTR(B.STD_DE, 6, 5) = A.MMDD AND B.MIN_TEMPER = A.MIN_TEMPER);
    