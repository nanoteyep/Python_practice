SELECT
    A.ADMINIST_ZONE_NM,
    A.FEMALE_POPLTN_CNT - A.MALE_POPLTN_CNT AS OVER_FEMALE              -- �����α� - �����α��� ���� ������ �󸶳� �� �������� ���մϴ�.
FROM
(
    SELECT
        A.ADMINIST_ZONE_NM,
        MAX(A.FEMALE_POPLTN_CNT) AS FEMALE_POPLTN_CNT,                  -- �ش� Į������ �����α��� ���� ����մϴ�.
        MAX(A.MALE_POPLTN_CNT) AS MALE_POPLTN_CNT                       -- �ش� Į������ ���� �α��� ���� ����մϴ�.
    FROM
    (
        SELECT
            A.ADMINIST_ZONE_NM,
            A.POPLTN_SE_CD,
            A.SUM_POPLTN,
            CASE WHEN A.POPLTN_SE_CD = 'F' THEN A.SUM_POPLTN ELSE 0 END AS FEMALE_POPLTN_CNT,       -- POPLTN_SE_CD�� F, �� �����̶�� ������ �α����� ���ϰ� �����α��� 0���� �Ӵϴ�.
            CASE WHEN A.POPLTN_SE_CD = 'M' THEN A.SUM_POPLTN ELSE 0 END AS MALE_POPLTN_CNT          -- POPLTN_SE_CD�� M, �� �����̶�� ������ �α����� ���ϰ� �����α��� 0���� �Ӵϴ�.
        FROM
        (
            SELECT 
                A.ADMINIST_ZONE_NM,
                A.POPLTN_SE_CD,
                SUM(A.POPLTN_CNT) AS SUM_POPLTN                                                     -- ������ ������ �α��� �հ踦 ���մϴ�.
            FROM TB_POPLTN A 
            WHERE A.ADMINIST_ZONE_NO NOT LIKE '_____00000'
            AND A.POPLTN_SE_CD IN ('F','M')
            
            GROUP BY A.ADMINIST_ZONE_NM, A.POPLTN_SE_CD
        ) A
    ) A
    
    GROUP BY A.ADMINIST_ZONE_NM
) A

ORDER BY OVER_FEMALE DESC;
