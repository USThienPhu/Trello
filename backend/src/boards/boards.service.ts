import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateBoardDto } from './dto/create-board.dto';
import { UpdateBoardDto } from './dto/update-board.dto';
import { Board } from './entities/board.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class BoardsService {
  

  constructor(
      @InjectRepository(Board)
      private boardsRepository: Repository<Board>, // Inject repository để dùng các hàm lưu/xóa
    ) {}
  

  async findAll() {
    return await this.boardsRepository.find({
      relations: ['owner'], // NestJS sẽ tự động JOIN với bảng USERS
    });
  }

  async create(createBoardDto: CreateBoardDto) {
    const newBoard =  this.boardsRepository.create(createBoardDto);
    return await this.boardsRepository.save(newBoard);
  }

  async findOne(id: string) {
    const board =  await this.boardsRepository.findOne({
      where: {id}
    });
    if (!board)
    {
      throw new NotFoundException(`Board với ID "${id}" không tồn tại`);
    }
  }

  async update(id: string, updateBoardDto: UpdateBoardDto) {
    const board = await this.boardsRepository.findOne({
      where: {id}
    });
    if (!board)
    {
      throw new NotFoundException(`Board với ID "${id}" không tồn tại`);
    }

    const updateBoard = await this.boardsRepository.merge(board, updateBoardDto);
    return await this.boardsRepository.save(updateBoard);
  }

  async remove(id: string) {
    const board = await this.boardsRepository.findOne({
      where: {id}
    });
    if (!board)
    {
      throw new NotFoundException(`Board với ID "${id}" không tồn tại`);
    }

    await this.boardsRepository.remove(board)
    return { message: `Đã xóa thành công bảng có ID ${id}` };
  }
}
