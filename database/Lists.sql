create table  LISTS (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	title varchar(255) not null,
	board_id uuid not null,
	position int not null,
	created_at TIMESTAMPTZ DEFAULT NOW(),
	
	constraint FK_LISTS_BOARDS
		foreign key(board_id)
		references BOARDS(id)
)
