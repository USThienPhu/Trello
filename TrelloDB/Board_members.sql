create table BOARD_MEMBERS (
	board_id uuid not null,
	user_id uuid not null ,
	role VARCHAR(20) DEFAULT 'member' CHECK (role IN ('admin', 'member')),
	joined_at TIMESTAMPTZ DEFAULT NOW(),
	
	PRIMARY KEY (board_id, user_id),
	
	constraint FK_BOARDMEMBERS_BOARDS
		foreign key(board_id)
		references BOARDS(id) ON DELETE CASCADE,
	constraint FK_BOARDMEMBERS_USER
		foreign key(user_id)
		references USERS(id) ON DELETE CASCADE
	
)