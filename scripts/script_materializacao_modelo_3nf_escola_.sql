create sequence seq_professor_id
increment by 1
minvalue 1
maxvalue 9999999
start 100;

create table professor (
	id_professor integer primary key not null default nextval('seq_professor_id'),
	nome_professor text not null
);

create sequence seq_materia_id
increment by 1
minvalue 1
maxvalue 9999999
start 100;

create table materia (
	id_materia integer primary key not null default nextval('seq_materia_id'),
	desc_materia text not null
);

create sequence seq_aluno_id
increment by 1
minvalue 1
maxvalue 9999999
start 100;

create table aluno (
	id_aluno integer primary key not null default nextval('seq_aluno_id'),
	nome_aluno text not null
);

create sequence seq_classe_id
increment by 1
minvalue 1
maxvalue 9999999
start 100;

create table classe (
	id_classe integer primary key not null default nextval('seq_classe_id'),
	id_professor integer,
	id_materia integer,
	desc_classe text not null,
	constraint professor_id_professor_fk foreign key (id_professor) references professor(id_professor),
	constraint materia_id_materia_fk foreign key (id_materia) references materia(id_materia)
);

--drop table agrup_classe;
create table agrup_classe (
	id_classe integer,
	id_aluno integer,
	constraint classe_id_classe_fk foreign key (id_classe) references classe(id_classe),
	constraint aluno_id_aluno_fk foreign key (id_aluno) references aluno(id_aluno)
);


