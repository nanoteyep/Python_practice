SELECT
    *
FROM
(
    SELECT
        A.STATN_NO,
        A.STATN_NM,
        A.HO_LN,
        A.NMPR_CNT,
        ROW_NUMBER() OVER(ORDER BY A.NMPR_CNT DESC) AS RANKING_NMPR
    FROM
    (
        SELECT
            A.STATN_NO,
            A.STATN_NM,
            A.HO_LN,
            SUM(A.NMPR_CNT) AS NMPR_CNT
        
        FROM TB_PBTRNSP A
        WHERE (A.BEGIN_TIME, A.END_TIME) IN (('2300','2400'),('0000','0100'),('0100','0200'),('0200','0300'),('0300','0400'))       -- 23시부터 04시까지로 시간을 한정합니다.
        AND A.TKCAR_GFF_SE_CD = 'TK'
        
        GROUP BY A.STATN_NO, A.STATN_NM, A.HO_LN
    ) A
) A
WHERE A.RANKING_NMPR <= 10;