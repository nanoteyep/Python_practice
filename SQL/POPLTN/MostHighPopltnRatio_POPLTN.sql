SELECT
    A.AGRDE_SE_CD,
    A.ADMINIST_ZONE_NO,
    A.ADMINIST_ZONE_NM,
    A.POPLTN_CNT,
    A.POPLTN_RATIO,
    A.RNUM
FROM
(
    SELECT
        A.AGRDE_SE_CD,
        A.ADMINIST_ZONE_NO,
        A.ADMINIST_ZONE_NM,
        A.POPLTN_CNT,
        A.POPLTN_RATIO,
        ROW_NUMBER() OVER(PARTITION BY A.AGRDE_SE_CD ORDER BY A.POPLTN_RATIO DESC) AS RNUM          --RDE_SE_CD를 그룹화 하여 POPLTN_RATIO순으로 내림차순으로 정렬하였으며 ROW_NUMBER를 이용해 순서대로 번호를 RUNM이라는 번호를 매깁니다. AG
    
    FROM
    (
        SELECT
            A.AGRDE_SE_CD,
            A.ADMINIST_ZONE_NO,
            A.ADMINIST_ZONE_NM,
            A.POPLTN_CNT,                                                                           -- RATIO_TO_REPORT를 이용해 ADMINIST_ZONE_NO별 POPLTN_CNT가 차지하는 비율을 구합니다.
            RATIO_TO_REPORT(A.POPLTN_CNT) OVER(PARTITION BY A.ADMINIST_ZONE_NO) AS POPLTN_RATIO
            
        FROM
        (
        SELECT
            A.AGRDE_SE_CD,
            A.ADMINIST_ZONE_NO,
            A.ADMINIST_ZONE_NM,
            A.POPLTN_CNT
            
        FROM TB_POPLTN A
        WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'
        AND A.POPLTN_SE_CD IN ('T')
        AND A.POPLTN_CNT > 0
        AND A.STD_MT = '202010'
        
        ORDER BY ADMINIST_ZONE_NO DESC
        ) A
    ) A
) A
WHERE RNUM <= 1;                            -- RNUM이 1인, 즉 가장 첫번째, 비율이 높은 행만 출력합니다.
