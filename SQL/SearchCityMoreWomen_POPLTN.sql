SELECT
    A.ADMINIST_ZONE_NM,
    A.FEMALE_POPLTN_CNT - A.MALE_POPLTN_CNT AS OVER_FEMALE              -- 여성인구 - 남성인구를 통해 여성이 얼마나 더 많은지를 구합니다.
FROM
(
    SELECT
        A.ADMINIST_ZONE_NM,
        MAX(A.FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT,                  -- 해당 칼럼에서 여성인구수 만을 출력합니다.
        MAX(A.MALE_POPLTN_CNT) AS MALE_POPLTN_CNT                       -- 해당 칼럼에서 남성 인구수 만을 출력합니다.
    FROM
    (
        SELECT
            A.ADMINIST_ZONE_NM,
            A.POPLTN_SE_CD,
            A.SUM_POPLTN,
            CASE WHEN A.POPLTN_SE_CD = 'F' THEN A.SUM_POPLTN ELSE 0 END AS FEMALE_POPLTN_CNT,       -- POPLTN_SE_CD가 F, 즉 여성이라면 여성의 인구수를 구하고 남성인구를 0으로 둡니다.
            CASE WHEN A.POPLTN_SE_CD = 'M' THEN A.SUM_POPLTN ELSE 0 END AS MALE_POPLTN_CNT          -- POPLTN_SE_CD가 M, 즉 남성이라면 남성의 인구수를 구하고 여성인구를 0으로 둡니다.
        FROM
        (
            SELECT 
                A.ADMINIST_ZONE_NM,
                A.POPLTN_SE_CD,
                SUM(A.POPLTN_CNT) AS SUM_POPLTN                                                     -- 남성과 여성의 인구수 합계를 구합니다.
            FROM TB_POPLTN A 
            WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'
            AND A.POPLTN_SE_CD IN ('F','M')
            
            GROUP BY A.ADMINIST_ZONE_NM, A.POPLTN_SE_CD
        ) A
    ) A
    
    GROUP BY A.ADMINIST_ZONE_NM
) A

ORDER BY OVER_FEMALE DESC;
