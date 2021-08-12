SELECT
    A.AGRDE_SE_CD,
    A.AGRDE_POPLTN_CNT,                                                                             -- 연령대별인구수/총 인구수 를 계산하여 연령대별 인구비율을 구하였습니다.
    TO_CHAR(ROUND((A.AGRDE_POPLTN_CNT/A.SUM_AGRDE_POPLTN_CNT) * 100, 2)) ||'%' AS "POPLTN RATIO",
    A.SUM_AGRDE_POPLTN_CNT AS "TOTAL POPLTN"

FROM
( 
        SELECT
            A.AGRDE_SE_CD,                                                                      -- 각 연령대별 인구수의 합을 구합니다. 즉, 대한민국 총 인구수입니다.
            A.AGRDE_POPLTN_CNT,
            SUM(A.AGRDE_POPLTN_CNT) OVER() AS SUM_AGRDE_POPLTN_CNT
        FROM
        (
            SELECT
                A.AGRDE_SE_CD,
                SUM(A.POPLTN_CNT) AS AGRDE_POPLTN_CNT                                   --연령대 별 인구수 합계입니다.
                
            FROM TB_POPLTN A
            WHERE A.POPLTN_SE_CD = 'T'
            AND A.STD_MT = '202010'
            AND A.ADMINIST_ZONE_NO LIKE '__00000000'
            
            GROUP BY A.AGRDE_SE_CD
            ORDER BY A.AGRDE_SE_CD
        ) A
) A
;