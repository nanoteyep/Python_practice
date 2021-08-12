CREATE TABLE tb_temper_data (
    std_de      CHAR(10),
    area_cd     CHAR(3),
    avg_temper  NUMBER(3, 1),
    min_temper  NUMBER(3, 1),
    max_temper  NUMBER(3, 1)
);

select * from tb_temper_data;