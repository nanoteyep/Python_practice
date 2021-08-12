SELECT
    A.CTPRVN_CD,
    A.CTPRVN_NM,
    A.SIGNGU_CD,
    A.SIGNGU_NM,
    A.TRDAR_INDUTY_LRGE_CL_CD,
    A.TRDAR_INDUTY_LRGE_CL_NM,
    COUNT(*) AS CNT                                         -- ��ü �� ��, �� ���� ���� �Դϴ�.

FROM TB_TRDAR A
WHERE SIGNGU_CD = '11680'                               -- ������ �ñ� �ڵ��Դϴ�.

GROUP BY A.CTPRVN_CD, A.CTPRVN_NM, A.SIGNGU_CD, A.SIGNGU_NM, A.TRDAR_INDUTY_LRGE_CL_CD, A.TRDAR_INDUTY_LRGE_CL_NM
ORDER BY CNT DESC;