SELECT *
FROM
( 
    SELECT
        A.CTPRVN_CD,
        A.CTPRVN_NM,
        A.SIGNGU_CD,
        A.SIGNGU_NM,
        A.ADSTRD_CD,
        A.ADSTRD_NM,
        COUNT(*) CNT
    FROM TB_TRDAR A
    WHERE ( A.CMPNM_NM LIKE '%��Ÿ����%'
            OR UPPER(A.CMPNM_NM) LIKE '%'||UPPER('STAR')||'%'||UPPER('BUKS')||'%')                  -- ��ȣ�� '��Ÿ����' ��� ���� �����ϰų� 'STAR BUKS'��� �ܾ ������ Ŀ���������� ã���ϴ�.
    AND A.TRDAR_INDUTY_SMALL_CL_CD = 'Q12A01'                                                       -- Ŀ�� �������� ��Ÿ���� �ڵ��Դϴ�. 
    
    GROUP BY A.CTPRVN_CD, A.CTPRVN_NM, A.SIGNGU_CD, A.SIGNGU_NM, A.ADSTRD_CD, A.ADSTRD_NM
    ORDER BY CNT DESC
) A
WHERE ROWNUM <= 10;
