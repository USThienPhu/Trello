# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a NestJS backend for a Trello-like application with board management. The API uses JWT authentication, role-based access control, and PostgreSQL with TypeORM.

## Common Commands

```bash
# Development (watch mode)
npm run start          # or: npm run s

# Tests
npm run test           # run all tests
npm run test:watch    # watch mode
npm run test:path-to-file # run single test file

# Linting
npm run lint

# Build
npm run build
```

## Architecture

### Module Structure
- **src/auth/** - JWT/Local authentication, JWT strategy, RolesGuard
- **src/users/** - User management module (admin-only full CRUD)
- **src/boards/** - Board CRUD with ownership guard (BoardOwnershipGuard)
- **src/lists/** - Lists belonging to boards
- **src/cards/** - Cards belonging to lists

### Entity Relationships
```
User (uuid)
  └── Board (owner_id -> User.id)
        └── List (board_id -> Board.id)
              └── Card (list_id -> List.id)
```

### Authentication & Authorization
- JWT token expires in 7 days, stored in auth.module.ts ('JWT_SECRET')
- Roles: `user`, `admin` (stored in User.role column)
- RolesGuard restricts endpoints by role (use @Roles() decorator)
- Ownership guards (e.g., BoardOwnershipGuard) enforce: owner or admin can modify

### API Documentation
- Swagger UI available at `/api` endpoint
- All protected endpoints require Bearer token in Authorization header

## Database

PostgreSQL database: `DB_Trello` (host: localhost:5432)
- TypeORM synchronize is `false` - use manual migrations in `../TrelloDB/` folder

## Key Patterns

- DTOs use class-validator + @nestjs/swagger decorators
- Guards are applied at controller level, not service level
- Owner guards check ownership via service queries
- Admin bypasses ownership checks in guards

## Configuration

Database credentials are hardcoded in src/app.module.ts (should use environment variables)