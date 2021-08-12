SELECT
    A.POPLTN_SE_CD,
    A.AGRDE_POPLTN_CNT,                                                                 -- 각 성별 별 인구 합을 전체 인구수로 나눠서 성별 비율을 구합니다.
    ROUND(A.AGRDE_POPLTN_CNT/A.TOTAL_AGRDE_POPLTN_CNT * 100, 3) ||'%' AS SEX_RATIO
FROM
(
    SELECT
        A.POPLTN_SE_CD,
        A.AGRDE_POPLTN_CNT,                                                              -- 전체 인구수를 구합니다.
        SUM(A.AGRDE_POPLTN_CNT) OVER() AS TOTAL_AGRDE_POPLTN_CNT
    
    FROM
    (
        SELECT
            A.POPLTN_SE_CD,                                                             -- 성별 별 인구수를 구합니다.
            SUM(A.POPLTN_CNT) AS AGRDE_POPLTN_CNT
        
        FROM TB_POPLTN A
        WHERE A.POPLTN_SE_CD IN ('M', 'F')
        AND A.ADMINIST_ZONE_NO LIKE '__00000000'
        AND A.STD_MT = '202010'
        
        GROUP BY A.POPLTN_SE_CD
        ORDER BY A.POPLTN_SE_CD
    ) A
) A
;