import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsInt, IsOptional } from 'class-validator';

export class CreateListDto {
  @ApiProperty({
    example: 'To Do',
    description: 'Title of the list',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  title: string;

  @ApiProperty({
    example: '550e8400-e29b-41d4-a716-446655440000',
    description: 'ID of the board this list belongs to',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  board_id: string;

  @ApiProperty({
    example: 0,
    description: 'Position of the list in the board (for ordering)',
    type: Number,
  })
  @IsInt()
  @IsOptional()
  position?: number;
}