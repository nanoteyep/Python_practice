SELECT *
FROM
(
    SELECT
        A.STATN_NO,
        A.STATN_NM,
        A.HO_LN,
        A.NMPR_CNT,
        ROW_NUMBER() OVER(PARTITION BY A.HO_LN ORDER BY A.NMPR_CNT DESC) AS RANKING_NMPR
    FROM
    (
        SELECT
            A.STATN_NO,
            A.STATN_NM,
            A.HO_LN,
            SUM(A.NMPR_CNT) AS NMPR_CNT
        FROM TB_PBTRNSP A
        
        GROUP BY A.STATN_NO, A.STATN_NM, A.HO_LN
    ) A
) A
WHERE RANKING_NMPR = 1

ORDER BY A.NMPR_CNT DESC;