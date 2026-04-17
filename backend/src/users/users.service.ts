import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { Repository } from 'typeorm';
import { User } from './entities/user.entity';
import { InjectRepository } from '@nestjs/typeorm';


@Injectable()
export class UsersService {

  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>, // Inject repository để dùng các hàm lưu/xóa
  ) {}

  
  async create(createUserDto: CreateUserDto) {
    const newUser = this.usersRepository.create(createUserDto);
    return await this.usersRepository.save(newUser); 
  }
  async findAll() {
    return await this.usersRepository.find(); 
  }

  async findOne(id: string) {               
    const user = await this.usersRepository.findOne({
      where: {id},
    });

    if (!user)
    {
      throw new NotFoundException(`User với ID "${id}" không tồn tại`);
    }
    return user;
  }

  async update(id: string, updateUserDto: UpdateUserDto) {
    const user = await this.usersRepository.findOne({
      where: {id},
    });
    if (!user)
    {
       throw new NotFoundException(`User với ID "${id}" không tồn tại`);
    }
    const updatedUser = this.usersRepository.merge(user, updateUserDto);
    return await this.usersRepository.save(updatedUser);
  }

  async remove(id: string) {
    const user = await this.usersRepository.findOneBy({ id });
    if (!user) {
      throw new NotFoundException(`User với ID ${id} không tồn tại`);
    }
    await this.usersRepository.remove(user);
    return { message: `Đã xóa thành công user có ID ${id}` };
  }
}
