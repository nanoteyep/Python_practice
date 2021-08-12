SELECT
    A.POPLTN_SE_CD,
    A.AGRDE_POPLTN_CNT,                                                                 -- �� ���� �� �α� ���� ��ü �α����� ������ ���� ������ ���մϴ�.
    ROUND(A.AGRDE_POPLTN_CNT/A.TOTAL_AGRDE_POPLTN_CNT * 100, 3) ||'%' AS SEX_RATIO
FROM
(
    SELECT
        A.POPLTN_SE_CD,
        A.AGRDE_POPLTN_CNT,                                                              -- ��ü �α����� ���մϴ�.
        SUM(A.AGRDE_POPLTN_CNT) OVER() AS TOTAL_AGRDE_POPLTN_CNT
    
    FROM
    (
        SELECT
            A.POPLTN_SE_CD,                                                             -- ���� �� �α����� ���մϴ�.
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