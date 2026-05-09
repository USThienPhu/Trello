CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
create table BOARDS (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	title varchar(255) not null,
	description  text,
	visibility varchar(10) not null check (visibility in ('private', 'public')),
	owner_id UUID not null,
	background_color VARCHAR(7) DEFAULT '#FFFFFF',
	create_at TIMESTAMPTZ default now(),
	
	constraint FK_BOARDS_USERS_OWNER_ID
		foreign key(owner_id)
		references USERS(id)
)