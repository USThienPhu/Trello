# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a NestJS backend for a Trello clone application. It uses TypeORM with PostgreSQL for data persistence. The database schema is created manually using SQL files (not synced automatically).

## Common Commands

```bash
# Development
cd backend
npm run start:dev   # or: npm run s  - Start with hot reload

# Build
npm run build

# Linting
npm run lint

# Testing
npm run test                    # Run all tests
npm run test:watch             # Watch mode
npm run test:cov               # With coverage
npm run test:e2e               # E2E tests

# Format
npm run format
```

## Architecture

### Module Structure
```
backend/src/
├── app.module.ts           # Root module (TypeORM config here)
├── main.ts                 # Bootstrap
├── users/                  # User management
├── boards/                 # Board CRUD
├── lists/                 # Lists within boards
└── cards/                 # Cards within lists
```

### Entity Relationships
- User → Boards (one-to-many via owner_id)
- Board → Lists (one-to-many via board_id)
- List → Cards (one-to-many via list_id)

### Entity Fields
- **Board**: id, title, description, visibility, owner_id, background_color, create_at
- **List**: id, title, board_id, position, created_at (position for ordering)
- **Card**: id, list_id, title, description, position, due_date, is_completed, created_at
- **User**: id, email, password, name, create_at

### Database Configuration
- PostgreSQL on localhost:5432
- Database: `DB_Trello`
- TypeORM `synchronize: false` - schema is managed via SQL files in `TrelloDB/`
- Entities: User, Board, List, Card (all use UUID primary keys)

### Key Files
- Backend entry: `backend/src/main.ts`
- TypeORM config: `backend/src/app.module.ts`
- Database SQL: `TrelloDB/` folder (Boards.sql, Lists.sql, Cards.sql, Users.sql, Board_members.sql)

## Notes

- Database credentials are hardcoded in `app.module.ts` - you may need to update them for your local setup
- All entities use `@PrimaryGeneratedColumn('uuid')` for ID generation
- Dates use `timestamptz` type for timezone-aware timestamps