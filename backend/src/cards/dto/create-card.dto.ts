import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsInt, IsOptional, IsBoolean, IsDate } from 'class-validator';

export class CreateCardDto {
  @ApiProperty({
    example: '550e8400-e29b-41d4-a716-446655440000',
    description: 'ID of the list this card belongs to',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  list_id: string;

  @ApiProperty({
    example: 'Complete project documentation',
    description: 'Title of the card',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  title: string;

  @ApiProperty({
    example: 'Write comprehensive documentation for all API endpoints',
    description: 'Detailed description of the card',
    type: String,
    required: false,
  })
  @IsString()
  @IsOptional()
  description?: string;

  @ApiProperty({
    example: 0,
    description: 'Position of the card in the list (for ordering)',
    type: Number,
    required: false,
  })
  @IsInt()
  @IsOptional()
  position?: number;

  @ApiProperty({
    example: '2026-06-01T00:00:00.000Z',
    description: 'Due date of the card',
    type: Date,
    required: false,
  })
  @IsDate()
  @IsOptional()
  due_date?: Date;

  @ApiProperty({
    example: false,
    description: 'Whether the card is completed',
    type: Boolean,
    required: false,
  })
  @IsBoolean()
  @IsOptional()
  is_completed?: boolean;
}