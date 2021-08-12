SELECT
    *
FROM
(
    SELECT
        A.ADMINIST_ZONE_NM,
        ROUND(A.FEMALE_POPLTN_CNT/A.TOTAL_POPLTN_CNT*100, 2) AS FEMALE_RATIO,
        ROUND(A.MALE_POPLTN_CNT/A.TOTAL_POPLTN_CNT*100, 2) AS MALE_RATIO,
        ROW_NUMBER() OVER(ORDER BY ROUND((FEMALE_POPLTN_CNT/TOTAL_POPLTN_CNT) * 100, 2) DESC) AS FEMALE_RATIO_RANKING,
        ROW_NUMBER() OVER(ORDER BY ROUND((MALE_POPLTN_CNT/TOTAL_POPLTN_CNT) * 100, 2) DESC) AS MALE_RATIO_RANKING
    FROM
    (
        SELECT
            A.ADMINIST_ZONE_NM,
            MAX(A.FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT,
            MAX(A.MALE_POPLTN_CNT) AS MALE_POPLTN_CNT,
            MAX(A.FEMALE_POPLTN_CNT) + MAX(A.MALE_POPLTN_CNT) AS TOTAL_POPLTN_CNT
        FROM
        (
            SELECT
                A.ADMINIST_ZONE_NM,
                CASE WHEN A.POPLTN_SE_CD = 'F' THEN SUM_POPLTN_CNT ELSE 0 END AS FEMALE_POPLTN_CNT,
                CASE WHEN A.POPLTN_SE_CD = 'M' THEN SUM_POPLTN_CNT ELSE 0 END AS MALE_POPLTN_CNT
            FROM
            (
                SELECT 
                    A.ADMINIST_ZONE_NM,
                    A.POPLTN_SE_CD,
                    SUM(A.POPLTN_CNT) AS SUM_POPLTN_CNT
                FROM TB_POPLTN A
                WHERE ADMINIST_ZONE_NO NOT LIKE '_____00000'
                AND POPLTN_SE_CD IN ('F', 'M')
                AND POPLTN_CNT > 0
                
                GROUP BY A.ADMINIST_ZONE_NM, A.POPLTN_SE_CD
            ) A
        ) A
        
        GROUP BY A.ADMINIST_ZONE_NM
    ) A
) A
WHERE A.FEMALE_RATIO_RANKING = 1 OR A.MALE_RATIO_RANKING = 1;
