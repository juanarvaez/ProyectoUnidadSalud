alter table consulta_medica_med drop index AK_FK_CONSULTA_MEDICA_MED_DIAGNOSTICO_MED1_IDX;
alter table consulta_medica_med drop diagnostico_med_idx;


--eliminar not null de columna
alter table quirurgico_med modify procedimientos_cups_med_codigo varchar(20);