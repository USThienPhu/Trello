import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { BoardsService } from './boards.service';
import { CreateBoardDto } from './dto/create-board.dto';
import { UpdateBoardDto } from './dto/update-board.dto';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { BoardOwnershipGuard } from './boards-owner.guard';

@ApiTags('Boards')
@ApiBearerAuth()
@Controller('boards')
@UseGuards(JwtAuthGuard)
export class BoardsController {
  constructor(private readonly boardsService: BoardsService) {}

  @Post()
  @ApiOperation({ summary: 'Create a new board' })
  @ApiResponse({
    status: 201,
    description: 'Board created successfully',
  })
  @ApiResponse({ status: 400, description: 'Bad request - Invalid input data' })
  create(@Body() createBoardDto: CreateBoardDto) {
    return this.boardsService.create(createBoardDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all boards' })
  @ApiResponse({
    status: 200,
    description: 'List of all boards',
  })
  findAll() {
    return this.boardsService.findAll();
  }

  @Get(':id')
  @UseGuards(BoardOwnershipGuard)
  @ApiOperation({ summary: 'Get a board by ID' })
  @ApiResponse({
    status: 200,
    description: 'Board found',
  })
  @ApiResponse({ status: 404, description: 'Board not found' })
  @ApiResponse({ status: 403, description: 'Forbidden - Not board owner' })
  findOne(@Param('id') id: string) {
    return this.boardsService.findOne(id);
  }

  @Patch(':id')
  @UseGuards(BoardOwnershipGuard)
  @ApiOperation({ summary: 'Update a board by ID' })
  @ApiResponse({
    status: 200,
    description: 'Board updated successfully',
  })
  @ApiResponse({ status: 404, description: 'Board not found' })
  @ApiResponse({ status: 403, description: 'Forbidden - Not board owner' })
  update(@Param('id') id: string, @Body() updateBoardDto: UpdateBoardDto) {
    return this.boardsService.update(id, updateBoardDto);
  }

  @Delete(':id')
  @UseGuards(BoardOwnershipGuard)
  @ApiOperation({ summary: 'Delete a board by ID' })
  @ApiResponse({
    status: 200,
    description: 'Board deleted successfully',
  })
  @ApiResponse({ status: 404, description: 'Board not found' })
  @ApiResponse({ status: 403, description: 'Forbidden - Not board owner' })
  remove(@Param('id') id: string) {
    return this.boardsService.remove(id);
  }
}