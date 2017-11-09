create database exercicio
go

create table disciplina (
    id int not null,
    nome varchar(240) not null,
    carga_horaria tinyint not null,
    teoria decimal(3) not null,
    pratica decimal (3) not null,
    ementa text,
    competencias text,
    habilidades text,
    conteudo text,
    biografia_basica text,
    biografia_complementar text,

    constraint id_disciplina primary key (id),
	  constraint uq_nome unique(nome)
);

create table curso (
    id int not null,
    sigla varchar (5),
    nome varchar not null (50),

    constraint pk_curso primary key (id),
    constraint uq_curso unique (nome, sigla)
);

create table professor (
    id int not null,
    ra int not null,
    apelido varchar(30),
    nome varchar not null (120),
    email varchar(80) not null,
    celular varchar(11),

    constraint pk_professor primary key (id),
    constraint uq_professor unique (apelido,ra)
);

create table aluno (
  id int not null,
	ra int,
	nome varchar not null (120),
	email varchar not null (80),
	celular varchar(11),
	sigla_curso char(2),

	constraint pk_aluno primary key (id),
	constraint uq_aluno unique (ra),
);


create table GradeCurricular (
    id int not null ,
    sigla_curso varchar not null (5),
    ano smallint,
    semestre char not null(1),
    id_curso int not null,

    constraint pk_gradecurricular primary key (id)
    constraint fk_idCurso foreign key (id_gradecurricular) references curso(id_curso),
    constraint uq_gradecurricular unique (ano, semestre,sigla_curso),
);

create table periodo (
    sigla_curso varchar (5),
    ano_grade smallint,
    semestre_grade char(1),
    numero tinyint,
	id_periodo int,

    constraint pk_periodo primary key (id_periodo),
	  constraint uq_periodo unique(sigla_curso, ano_grade, semestre_grade, numero),
	  constraint fk_periodo foreign key (id_periodo) references grade_curricular(id_gradecurricular),
);

create table periodo_disciplina (
	sigla_curso varchar (5),
    ano_grade smallint,
	semestre_grade char(1),
    numero_periodo tinyint,
	nome_disciplina varchar (240),
	id_periododisciplina int,

	constraint pk_periododisciplina primary key (id_periododisciplina),
	constraint uq_periododisciplina unique (sigla_curso,ano_grade,semestre_grade,numero_periodo,nome_disciplina),
	constraint fk_periododisciplina foreign key (id_periododisciplina) references periodo(id_periodo)
);

create table disciplina_ofertada (
	nome_disciplina varchar(240),
	ano smallint,
	semestre char(1),
	id_disciplinaofertada int

	constraint pk_iddisciplinaofertada primary key(id_disciplinaofertada),
	constraint uq_iddisciplinaofertada unique (nome_disciplina, ano, semestre),
	constraint fk_iddisciplinaofertada foreign key (id_disciplinaofertada) references disciplina(id_disciplina)
);

create table turma (
	nome_disciplina varchar(240),
	ano_ofertado smallint,
	semestre_ofertado char(1),
	id char(1),
	turno varchar(15),
	ra_professor int,
	id_turma int

	constraint pk_turma primary key(id_turma),
	constraint fk_turma foreign key (id_turma) references professor (id_professor),
	constraint fk_turma foreign key (id_turma) references disciplinaofertada (id_disciplinaofertada),
	constraint uq_turma unique (nome_disciplina,ano_ofertado,semestre_ofertado,id)
);

create table cursoturma (
	sigla_curso varchar(5),
	nome_disciplina varchar(240),
	ano_ofertado smallint,
	semestre_ofertado char(1),
	id_turma char (1),
	id_cursoturma int,

	constraint uq_cursoturma unique (sigla_curso, nome_disciplina, ano_ofertado,semestre_ofertado,id_turma),
	constraint fk_cursoturma foreign key (id_cursoturma) references turma (id_turma),
	constraint fk_cursoturma foreign key (id_cursoturma) references curso(id_curso),
	constraint pk_cursoturma primary key (id_cursoturma)
);
