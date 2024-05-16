truncate table professor cascade;
ALTER SEQUENCE seq_professor_id RESTART; 
insert into professor
select 
	nextval('seq_professor_id') as id,
	* 
from (
	select distinct 
		fde.professor 
	from fonte_de_dados.dados_escola fde
) t;

truncate table materia cascade;
ALTER SEQUENCE seq_materia_id RESTART; 
insert into materia
select 
	nextval('seq_materia_id') as id,
	* 
from (
	select distinct 
		fde.materia 
	from fonte_de_dados.dados_escola fde
) t;

truncate table aluno cascade;
ALTER SEQUENCE seq_aluno_id RESTART; 
insert into aluno
select 
	nextval('seq_aluno_id') as id,
	* 
from (
	select distinct 
		fde.estudante 
	from fonte_de_dados.dados_escola fde
) t;

truncate table classe cascade;
ALTER SEQUENCE seq_classe_id RESTART; 
insert into classe
select 
	nextval('seq_classe_id') as id_classe,
	* 
from (
	select distinct 
		p.id_professor,
		m.id_materia, 
		upper(fde.numclasse) as desc_classe 
		--lower(fde.numclasse) as desc_classe
	from fonte_de_dados.dados_escola fde
	join professor p 
		on fde.professor = p.nome_professor 
	join materia m 
		on fde.materia = m.desc_materia 		
) t;


truncate table agrup_classe cascade;
insert into agrup_classe
select  
	c2.id_classe,
	a2.id_aluno 
from classe c2 
join fonte_de_dados.dados_escola fde 
	on c2.desc_classe = upper(fde.numclasse)
join aluno a2 
	on fde.estudante = a2.nome_aluno 
;

