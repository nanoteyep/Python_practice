SELECT *
FROM
(  
    SELECT
        A.ADMINIST_ZONE_NO,
        A.ADMINIST_ZONE_NM,
        A.SIGNGU_CD,
        A.POPLTN_CNT,
        A.ACADEMY_CNT,
        TRUNC(A.POPLTN_CNT/A.ACADEMY_CNT) AS ACADEMY_PER_POPLTN
    FROM
    (
        SELECT
            A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT AS POPLTN_CNT,
            B.SIGNGU_CD,
            COUNT(*) AS ACADEMY_CNT
            
        FROM
        (
            SELECT
                A.ADMINIST_ZONE_NO,
                A.ADMINIST_ZONE_NM,
                SUM(POPLTN_CNT) AS POPLTN_CNT
            FROM TB_POPLTN A
            WHERE A.POPLTN_SE_CD = 'T'
            AND A.AGRDE_SE_CD IN ('000','010')                                                  -- 10대만 구합니다
            AND A.ADMINIST_ZONE_NO LIKE '_____00000'
            
            GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
        ) A,
        TB_TRDAR B
        WHERE SUBSTR(A.ADMINIST_ZONE_NO, 1, 5) = B.SIGNGU_CD
        AND B.TRDAR_INDUTY_LRGE_CL_CD = 'R'                                                     -- 학원을 나타내는 분류 코드입니다.
        
        GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, B.SIGNGU_CD
        ORDER BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
    ) A
    
    ORDER BY ACADEMY_PER_POPLTN DESC
)
WHERE ROWNUM <= 10;