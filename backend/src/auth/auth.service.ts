import { Injectable, UnauthorizedException, ConflictException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { User } from '../users/entities/user.entity';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
    private jwtService: JwtService,
  ) {}

  async validateUser(username: string, password: string): Promise<any> {
    const user = await this.usersRepository.findOne({
      where: { username },
    });

    if (user && (await bcrypt.compare(password, user.password_hashed))) {
      const { password_hashed, ...result } = user;
      return result;
    }
    return null;
  }

  async login(user: User) {
    
    if (!user) {
      throw new UnauthorizedException('Invalid credentials');
    }
    const payload = { sub: user.id, username: user.username, role: user.role };
    return {
      access_token: this.jwtService.sign(payload),
      user: {
        id: user.id,
        username: user.username,
        email: user.email,
        fullname: user.fullname,
        avatar_url: user.avatar_url,
        role: user.role,
      },
    };
  }

  async register(registerDto: RegisterDto) {
    const existingUser = await this.usersRepository.findOne({
      where: [{ username: registerDto.username }, { email: registerDto.email }],
    });

    if (existingUser) {
      if (existingUser.username === registerDto.username) {
        throw new ConflictException('Username already exists');
      }
      throw new ConflictException('Email already exists');
    }

    const hashedPassword = await bcrypt.hash(registerDto.password, 10);
    const newUser = this.usersRepository.create({
      username: registerDto.username,
      email: registerDto.email,
      password_hashed: hashedPassword,
      fullname: registerDto.fullname,
    });

    await this.usersRepository.save(newUser);

    const { password_hashed, ...user } = newUser;
    return user;
  }
}