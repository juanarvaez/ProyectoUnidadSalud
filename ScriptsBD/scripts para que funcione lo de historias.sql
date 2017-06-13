alter table consulta_medica_med drop index AK_FK_CONSULTA_MEDICA_MED_DIAGNOSTICO_MED1_IDX;
alter table consulta_medica_med drop diagnostico_med_idx;

alter table quirurgico_med modify procedimientos_cups_med_codigo varchar(20);

insert into patologicos_med (nombre) values ('Hipertension');
insert into patologicos_med (nombre) values ('Diabetes');
insert into patologicos_med (nombre) values ('Obesidad');
insert into patologicos_med (nombre) values ('Cardiopaias');
insert into patologicos_med (nombre) values ('Cancer');
insert into patologicos_med (nombre) values ('Tuberculosis');
insert into patologicos_med (nombre) values ('Enfermedad mental');
insert into patologicos_med (nombre) values ('Enfermedades venereas');
insert into patologicos_med (nombre) values ('Otros');

insert into tipo_habito (nombre) values("ALCOHOL");
insert into tipo_habito (nombre) values("DEPORTE");
insert into tipo_habito (nombre) values("TABACO");
insert into tipo_habito (nombre) values("OTROS");