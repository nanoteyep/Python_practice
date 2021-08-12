SELECT *
FROM
(
    SELECT
        A.ADMINIST_ZONE_NO,
        A.ADMINIST_ZONE_NM,
        A.POPLTN_CNT,
        A.COFFEESHOP_CNT,
        TRUNC(A.POPLTN_CNT/A.COFFEESHOP_CNT) AS SHOP_PER_POPLTN                     -- ���� �� �α����� ���մϴ�.
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
        TB_TRDAR B                                                                  -- �����ϴ� ���̺��� �ΰ��� �����մϴ�.
        WHERE SUBSTR(A.ADMINIST_ZONE_NO, 1, 5) = B.SIGNGU_CD                        -- A, �� �α����� �����ϴ� ���̺��� ���� ������ȣ�� B, �� �󰡸� ��ȸ�ϴ� ���̺��� �ñ��ڵ尡 ��ġ�ϴ� �����͸� �����ɴϴ�.
        AND B.TRDAR_INDUTY_SMALL_CL_CD = 'Q12A01'
        
        GROUP BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM, A.POPLTN_CNT, B.SIGNGU_CD
        ORDER BY A.ADMINIST_ZONE_NO, A.ADMINIST_ZONE_NM
    ) A
    
    ORDER BY SHOP_PER_POPLTN DESC
)
WHERE ROWNUM <= 10;