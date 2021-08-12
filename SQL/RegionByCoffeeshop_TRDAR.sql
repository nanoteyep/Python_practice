SELECT *
FROM
(
    SELECT
        A.ADMINIST_ZONE_NO,
        A.ADMINIST_ZONE_NM,
        A.POPLTN_CNT,
        A.COFFEESHOP_CNT,
        TRUNC(A.POPLTN_CNT/A.COFFEESHOP_CNT) AS SHOP_PER_POPLTN                     -- 매장 당 인구수를 구합니다.
    FROM
    (
        SELECT
            A.ADMINIST_ZONE_NO,
            A.ADMINIST_ZONE_NM,
            A.POPLTN_CNT AS POPLTN_CNT,
            B.SIGNGU_CD,
            COUNT(*) AS COFFEESHOP_CNT
        FROM
        (
            SELECT
                A.ADMINIST_ZONE_NO,
                A.ADMINIST_ZONE_NM,
                SUM(POPLTN_CNT) AS POPLTN_CNT
            FROM TB_POPLTN A
            WHERE A.POPLTN_SE_CD = 'T'
            AND A.ADMINIST_ZONE_NO LIKE '_____00000'
            
            GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
        ) A, 
        TB_TRDAR B                                                                  -- 참조하는 테이블을 두개로 지정합니다.
        WHERE SUBSTR(A.ADMINIST_ZONE_NO, 1, 5) = B.SIGNGU_CD                        -- A, 즉 인구수를 참조하는 테이블에서 구한 지역번호와 B, 즉 상가를 조회하는 테이블에서 시군코드가 일치하는 데이터만 가져옵니다.
        AND B.TRDAR_INDUTY_SMALL_CL_CD = 'Q12A01'
        
        GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, B.SIGNGU_CD
        ORDER BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
    ) A
    
    ORDER BY SHOP_PER_POPLTN DESC
)
WHERE ROWNUM <= 10;