create database exercicio
go

create table Disciplina (
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

create table Curso (
    id int IDENTITY(1,1) not null ,
    sigla varchar (5),
    nome varchar not null (50),

    constraint pk_curso primary key (id),
    constraint uq_curso unique (nome, sigla)
);

create table Professor (
    id int IDENTITY(1,1) not null,
    ra int not null,
    apelido varchar(30),
    nome varchar not null (120),
    email varchar(80) not null,
    celular varchar(11),

    constraint pk_professor primary key (id),
    constraint uq_professor unique (apelido,ra)
);

create table Aluno (
  	id int IDENTITY(1,1) not null,
	ra int not null,
	nome varchar not null (120),
	email varchar not null (80),
	celular varchar(11),
	sigla_curso char(2),

	constraint pk_aluno primary key (id),
	constraint uq_aluno unique (ra),
);


create table GradeCurricular (
    id int IDENTITY(1,1) not null,
    sigla_curso varchar not null (5),
    ano smallint,
    semestre char not null(1),
    id_curso int not null,

    constraint pk_gradecurricular primary key (id)
    constraint fk_idCurso foreign key (id_curso) references curso(id),
    constraint uq_gradecurricular unique (ano, semestre,sigla_curso),
);

create table Periodo (
	id int IDENTITY(1,1) not null,
    sigla_curso varchar (5),
    ano_grade smallint,
    semestre_grade char(1),
    numero tinyint,
	id_gradecurricular int id int IDENTITY(1,1) not null,

    constraint pk_periodo primary key (id),
    constraint uq_periodo unique(sigla_curso, ano_grade, semestre_grade, numero),
    constraint fk_periodo foreign key (id_gradecurricular) references GradeCurricular(id),
);

create table PeriodoDisciplina (
	id int id int IDENTITY(1,1) not null,
	sigla_curso varchar (5),
    ano_grade smallint,
	semestre_grade char(1),
    numero_periodo tinyint,
	nome_disciplina varchar (240),
	id_periodo in IDENTITY(1,1) not null,

	constraint pk_periododisciplina primary key (id),
	constraint uq_periododisciplina unique (sigla_curso,ano_grade,semestre_grade,numero_periodo,nome_disciplina),
	constraint fk_periododisciplina foreign key (id_periodo) references Periodo(id)
);

create table DisciplinaOfertada (
	id int id int IDENTITY(1,1) not null,
	nome_disciplina varchar(240) not null,
	ano smallint,
	semestre char(1),
	id_disciplina int IDENTITY(1,1) not null,
	

	constraint pk_iddisciplinaofertada primary key(id),
	constraint uq_iddisciplinaofertada unique (nome_disciplina, ano, semestre),
	constraint fk_iddisciplinaofertada foreign key (id_disciplina) references Disciplina(id)
);

create table Turma (
	id int IDENTITY(1,1) not null,
	nome_disciplina varchar(240),
	ano_ofertado smallint,
	semestre_ofertado char(1),
	turno varchar(15),
	ra_professor int,
	id_professor int IDENTITY(1,1) not null,
	id_disciplinaofertada int IDENTITY(1,1) not null,

	constraint pk_turma primary key(id),
	constraint fk_turma foreign key (id_professor) references professor(id),
	constraint fk_turma foreign key (id_disciplinaofertada) references DisciplinaOfertada(id),
	constraint uq_turma unique (nome_disciplina,ano_ofertado,semestre_ofertado,id)
);

create table CursoTurma (
	id int IDENTITY(1,1) not null,
	sigla_curso varchar(5),
	nome_disciplina varchar(240),
	ano_ofertado smallint,
	semestre_ofertado char(1),
	id_turma char (1),
	id_curso int IDENTITY(1,1) not null,

	constraint pk_cursoturma primary key (id)
	constraint uq_cursoturma unique (sigla_curso, nome_disciplina, ano_ofertado,semestre_ofertado,id_turma),
	constraint fk_cursoturma foreign key (id_curso_turma) references Turma (id),
	constraint fk_cursoturma foreign key (id_curso) references Curso(id),
);

create table Matricula( /* Pronto */
	id int IDENTITY(1,1) not null,
	id_turma int IDENTITY(1,1) not null,
	id_aluno  int IDENTITY(1,1) not null,

	constraint Pk_Matricula primary key (id),
	constraint Fk_id_turma foreign key (id_turma) references Turma(id),
	constraint Fk_id_aluno foreign key (id_aluno) references Aluno(id),
);

create table 