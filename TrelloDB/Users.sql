CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create table USERS (
	id UUID primary key DEFAULT uuid_generate_v4(),
	username varchar(50) unique not null,
	email varchar(255) unique not null,
	password_hashed text not null,
	fullname varchar(100),
	avatar_url text,
	is_active boolean,
	created_at TIMESTAMPTZ DEFAULT NOW()	
)
