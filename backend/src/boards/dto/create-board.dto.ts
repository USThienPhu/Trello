import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsOptional } from 'class-validator';

export class CreateBoardDto {
  @ApiProperty({
    example: 'My First Board',
    description: 'Title of the board',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  title: string;

  @ApiProperty({
    example: 'This is a description of my board',
    description: 'Description of the board',
    type: String,
    required: false,
  })
  @IsString()
  @IsOptional()
  description?: string;

  @ApiProperty({
    example: 'private',
    description: 'Visibility of the board (public or private)',
    type: String,
    enum: ['public', 'private'],
  })
  @IsString()
  @IsNotEmpty()
  visibility: string;

  @ApiProperty({
    example: '550e8400-e29b-41d4-a716-446655440000',
    description: 'ID of the owner (user) who owns this board',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  owner_id: string;

  @ApiProperty({
    example: '#FF5733',
    description: 'Background color of the board (hex color code)',
    type: String,
    required: false,
  })
  @IsString()
  background_color?: string;
}