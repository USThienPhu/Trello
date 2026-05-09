import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiBearerAuth,
} from '@nestjs/swagger';
import { CardsService } from './cards.service';
import { CreateCardDto } from './dto/create-card.dto';
import { UpdateCardDto } from './dto/update-card.dto';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { CardOwnershipGuard } from './cards-owner.guard';

@ApiTags('Cards')
@ApiBearerAuth()
@Controller('cards')
@UseGuards(JwtAuthGuard)
export class CardsController {
  constructor(private readonly cardsService: CardsService) {}

  @Post()
  @ApiOperation({ summary: 'Create a new card' })
  @ApiResponse({
    status: 201,
    description: 'Card created successfully',
  })
  @ApiResponse({ status: 400, description: 'Bad request - Invalid input data' })
  @ApiResponse({ status: 404, description: 'List not found' })
  create(@Body() createCardDto: CreateCardDto) {
    return this.cardsService.create(createCardDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all cards' })
  @ApiResponse({
    status: 200,
    description: 'List of all cards',
  })
  findAll() {
    return this.cardsService.findAll();
  }

  @Get(':id')
  @UseGuards(CardOwnershipGuard)
  @ApiOperation({ summary: 'Get a card by ID' })
  @ApiResponse({
    status: 200,
    description: 'Card found',
  })
  @ApiResponse({ status: 404, description: 'Card not found' })
  @ApiResponse({ status: 403, description: 'Forbidden - Not board owner' })
  findOne(@Param('id') id: string) {
    return this.cardsService.findOne(id);
  }

  @Patch(':id')
  @UseGuards(CardOwnershipGuard)
  @ApiOperation({ summary: 'Update a card by ID' })
  @ApiResponse({
    status: 200,
    description: 'Card updated successfully',
  })
  @ApiResponse({ status: 404, description: 'Card not found' })
  @ApiResponse({ status: 403, description: 'Forbidden - Not board owner' })
  update(@Param('id') id: string, @Body() updateCardDto: UpdateCardDto) {
    return this.cardsService.update(id, updateCardDto);
  }

  @Delete(':id')
  @UseGuards(CardOwnershipGuard)
  @ApiOperation({ summary: 'Delete a card by ID' })
  @ApiResponse({
    status: 200,
    description: 'Card deleted successfully',
  })
  @ApiResponse({ status: 404, description: 'Card not found' })
  @ApiResponse({ status: 403, description: 'Forbidden - Not board owner' })
  remove(@Param('id') id: string) {
    return this.cardsService.remove(id);
  }
}