import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsEmail, IsNotEmpty, MinLength } from 'class-validator';

export class CreateUserDto {
  @ApiProperty({
    example: 'johndoe',
    description: 'Unique username for the user',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  username: string;

  @ApiProperty({
    example: 'johndoe@example.com',
    description: 'User email address (must be unique)',
    type: String,
  })
  @IsString()
  @IsEmail()
  email: string;

  @ApiProperty({
    example: 'hashed_password_string',
    description: 'Hashed password of the user',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  password_hashed: string;

  @ApiProperty({
    example: 'John Doe',
    description: 'Full name of the user',
    type: String,
    required: false,
  })
  @IsString()
  fullname?: string;

  @ApiProperty({
    example: 'https://example.com/avatar.jpg',
    description: 'URL to user avatar image',
    type: String,
    required: false,
  })
  @IsString()
  avatar_url?: string;

  @ApiProperty({
    example: true,
    description: 'Whether the user account is active',
    type: Boolean,
    required: false,
  })
  is_active?: boolean;
}