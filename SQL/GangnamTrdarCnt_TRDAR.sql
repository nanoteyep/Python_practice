SELECT
    A.CTPRVN_CD,
    A.CTPRVN_NM,
    A.SIGNGU_CD,
    A.SIGNGU_NM,
    A.TRDAR_INDUTY_LRGE_CL_CD,
    A.TRDAR_INDUTY_LRGE_CL_NM,
    COUNT(*) AS CNT                                         -- 전체 행 수, 즉 상가의 갯수 입니다.

FROM TB_TRDAR A
WHERE SIGNGU_CD = '11680'                               -- 강남의 시군 코드입니다.

GROUP BY A.CTPRVN_CD, A.CTPRVN_NM, A.SIGNGU_CD, A.SIGNGU_NM, A.TRDAR_INDUTY_LRGE_CL_CD, A.TRDAR_INDUTY_LRGE_CL_NM
ORDER BY CNT DESC;