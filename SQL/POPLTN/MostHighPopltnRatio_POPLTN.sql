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
        ROW_NUMBER() OVER(PARTITION BY A.AGRDE_SE_CD ORDER BY A.POPLTN_RATIO DESC) AS RNUM          --RDE_SE_CD�� �׷�ȭ �Ͽ� POPLTN_RATIO������ ������������ �����Ͽ����� ROW_NUMBER�� �̿��� ������� ��ȣ�� RUNM�̶�� ��ȣ�� �ű�ϴ�. AG
    
    FROM
    (
        SELECT
            A.AGRDE_SE_CD,
            A.ADMINIST_ZONE_NO,
            A.ADMINIST_ZONE_NM,
            A.POPLTN_CNT,                                                                           -- RATIO_TO_REPORT�� �̿��� ADMINIST_ZONE_NO�� POPLTN_CNT�� �����ϴ� ������ ���մϴ�.
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
WHERE RNUM <= 1;                            -- RNUM�� 1��, �� ���� ù��°, ������ ���� �ุ ����մϴ�.
