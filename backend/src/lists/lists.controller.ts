import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { ListsService } from './lists.service';
import { CreateListDto } from './dto/create-list.dto';
import { UpdateListDto } from './dto/update-list.dto';

@ApiTags('Lists')
@ApiBearerAuth()
@Controller('lists')
export class ListsController {
  constructor(private readonly listsService: ListsService) {}

  @Post()
  @ApiOperation({ summary: 'Create a new list' })
  @ApiResponse({
    status: 201,
    description: 'List created successfully',
  })
  @ApiResponse({ status: 400, description: 'Bad request - Invalid input data' })
  @ApiResponse({ status: 404, description: 'Board not found' })
  create(@Body() createListDto: CreateListDto) {
    return this.listsService.create(createListDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all lists' })
  @ApiResponse({
    status: 200,
    description: 'List of all lists',
  })
  findAll() {
    return this.listsService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get a list by ID' })
  @ApiResponse({
    status: 200,
    description: 'List found',
  })
  @ApiResponse({ status: 404, description: 'List not found' })
  findOne(@Param('id') id: string) {
    return this.listsService.findOne(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Update a list by ID' })
  @ApiResponse({
    status: 200,
    description: 'List updated successfully',
  })
  @ApiResponse({ status: 404, description: 'List not found' })
  update(@Param('id') id: string, @Body() updateListDto: UpdateListDto) {
    return this.listsService.update(id, updateListDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Delete a list by ID' })
  @ApiResponse({
    status: 200,
    description: 'List deleted successfully',
  })
  @ApiResponse({ status: 404, description: 'List not found' })
  remove(@Param('id') id: string) {
    return this.listsService.remove(id);
  }
}