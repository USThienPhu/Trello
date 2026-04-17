create table CARDS (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	list_id uuid not null,
	title text not null, 
	description text,
	position int not null,
	due_date TIMESTAMPTZ,
	is_completed BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMPTZ DEFAULT NOW(),
	
	constraint FK_CARDS_LISTS
		foreign key(list_id)
		references LISTS(id)
)

