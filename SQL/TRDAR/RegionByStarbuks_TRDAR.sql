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
    WHERE ( A.CMPNM_NM LIKE '%스타벅스%'
            OR UPPER(A.CMPNM_NM) LIKE '%'||UPPER('STAR')||'%'||UPPER('BUKS')||'%')                  -- 상호에 '스타벅스' 라는 말을 포함하거나 'STAR BUKS'라는 단어를 포함한 커피전문점을 찾습니다.
    AND A.TRDAR_INDUTY_SMALL_CL_CD = 'Q12A01'                                                       -- 커피 전문점을 나타내는 코드입니다. 
    
    GROUP BY A.CTPRVN_CD, A.CTPRVN_NM, A.SIGNGU_CD, A.SIGNGU_NM, A.ADSTRD_CD, A.ADSTRD_NM
    ORDER BY CNT DESC
) A
WHERE ROWNUM <= 10;
