SELECT *
FROM
(
    SELECT
        A.STATN_NO,
        A.STATN_NM,
        A.HO_LN,
        A.TK_NMPR_CNT,
        A.GF_NMPR_CNT,
        ROW_NUMBER() OVER(ORDER BY A.TK_NMPR_CNT DESC) AS RANKING_TK_DESC,
        ROW_NUMBER() OVER(ORDER BY A.TK_NMPR_CNT) AS RANKING_TK_ASC,
        ROW_NUMBER() OVER(ORDER BY A.GF_NMPR_CNT DESC) AS RANKING_GF_DESC,
        ROW_NUMBER() OVER(ORDER BY A.GF_NMPR_CNT) AS RANKING_GF_ASC
    FROM
        (
        SELECT
            A.STATN_NO,
            A.STATN_NM,
            A.HO_LN,
            MAX(A.TK_NMPR_CNT) AS TK_NMPR_CNT,
            MAX(A.GF_NMPR_CNT) AS GF_NMPR_CNT
        FROM
        (
            SELECT
                A.STATN_NO,
                A.STATN_NM,
                A.HO_LN,
                CASE WHEN A.TKCAR_GFF_SE_CD = 'TK' THEN A.NMPR_CNT ELSE 0 END AS TK_NMPR_CNT,
                CASE WHEN A.TKCAR_GFF_SE_CD = 'GF' THEN A.NMPR_CNT ELSE 0 END AS GF_NMPR_CNT
            FROM
            ( 
                SELECT
                    A.STATN_NO,
                    A.STATN_NM,
                    A.HO_LN,
                    A.TKCAR_GFF_SE_CD,
                    SUM(NMPR_CNT) AS NMPR_CNT
                    
                FROM TB_PBTRNSP A
                
                GROUP BY A.STATN_NO, A.STATN_NM, A.HO_LN, A.TKCAR_GFF_SE_CD
                ORDER BY NMPR_CNT DESC
            ) A
        ) A
        
        GROUP BY A.STATN_NO, A.STATN_NM, A.HO_LN
    ) A
) A
WHERE A.RANKING_TK_DESC = 1 OR A.RANKING_TK_ASC = 1 OR A.RANKING_GF_DESC = 1 OR A.RANKING_GF_ASC = 1;