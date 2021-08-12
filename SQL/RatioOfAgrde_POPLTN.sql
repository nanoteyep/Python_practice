SELECT
    A.AGRDE_SE_CD,
    A.AGRDE_POPLTN_CNT,                                                                             -- ���ɴ뺰�α���/�� �α��� �� ����Ͽ� ���ɴ뺰 �α������� ���Ͽ����ϴ�.
    TO_CHAR(ROUND((A.AGRDE_POPLTN_CNT/A.SUM_AGRDE_POPLTN_CNT) * 100, 2)) ||'%' AS "POPLTN RATIO",
    A.SUM_AGRDE_POPLTN_CNT AS "TOTAL POPLTN"

FROM
( 
        SELECT
            A.AGRDE_SE_CD,                                                                      -- �� ���ɴ뺰 �α����� ���� ���մϴ�. ��, ���ѹα� �� �α����Դϴ�.
            A.AGRDE_POPLTN_CNT,
            SUM(A.AGRDE_POPLTN_CNT) OVER() AS SUM_AGRDE_POPLTN_CNT
        FROM
        (
            SELECT
                A.AGRDE_SE_CD,
                SUM(A.POPLTN_CNT) AS AGRDE_POPLTN_CNT                                   --���ɴ� �� �α��� �հ��Դϴ�.
                
            FROM TB_POPLTN A
            WHERE A.POPLTN_SE_CD = 'T'
            AND A.STD_MT = '202010'
            AND A.ADMINIST_ZONE_NO LIKE '__00000000'
            
            GROUP BY A.AGRDE_SE_CD
            ORDER BY A.AGRDE_SE_CD
        ) A
) A
;