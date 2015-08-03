create table tasks (
task_id	serial	primary key,
task_name	varchar(20)	not null,
task_status	varchar(10)	not null,
task_content	text not null,
task_no integer	not null,
priority	varchar(5)	not null,
progress	integer,
tag	text,
creator_id	integer,
engineer_id	integer,
project_id	integer,
anticipated_commencement_date	date	not null,
expected_completion_date	date	not null,
finish_date	date,
completion_date	date,
completion_flg	boolean	not null,
created_at	timestamp(3)	not null,
updated_at	timestamp(3)	not null,
deleted_flg	boolean	not null
)