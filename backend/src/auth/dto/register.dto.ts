import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNotEmpty, IsEmail, MinLength } from 'class-validator';

export class RegisterDto {
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
    description: 'User email address',
    type: String,
  })
  @IsString()
  @IsEmail()
  email: string;

  @ApiProperty({
    example: 'password123',
    description: 'User password (min 6 characters)',
    type: String,
  })
  @IsString()
  @MinLength(6)
  password: string;

  @ApiProperty({
    example: 'John Doe',
    description: 'Full name of the user',
    type: String,
  })
  @IsString()
  @IsNotEmpty()
  fullname: string;
}