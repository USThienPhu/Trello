import { Injectable,NotFoundException , InternalServerErrorException} from '@nestjs/common';
import { CreateListDto } from './dto/create-list.dto';
import { UpdateListDto } from './dto/update-list.dto';
import {List } from './entities/list.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class ListsService {

  constructor (
    @InjectRepository(List)
    private listRepository: Repository<List>,
  ) {}

  async create(createListDto: CreateListDto) {
    const newList = this.listRepository.create(createListDto);
    return await this.listRepository.save(newList);
  }

  async findAll() {
    try {
      const results = await this.listRepository.find({
        relations: ['board'],
      });

      if (!results || results.length === 0) {
        // Chủ động ném lỗi 404 nếu không tìm thấy dữ liệu
        throw new NotFoundException('Không tìm thấy danh sách nào');
      }

      return results;
    } catch (error) {
      // Nếu lỗi do database (sai tên cột, sai relation), ta ném lỗi BadRequest hoặc giữ nguyên 500
      throw new InternalServerErrorException('Lỗi truy vấn cơ sở dữ liệu: ' + error.message);
    }
  }

  async findOne(id: string) {
    const list = await this.listRepository.findOne({where: {id}});
    if (!list)
    {
      throw new NotFoundException(`List với ID "${id}" không tồn tại`);
    }

    return list;
  }

  async update(id: string, updateListDto: UpdateListDto) {
    const list = await this.listRepository.findOne({
      where: {id}
    });
    if (!list)
    {
      throw new NotFoundException(`List với ID "${id}" không tồn tại`);
    }

    const updateList = await this.listRepository.merge(list, updateListDto);
    return await this.listRepository.save(updateList);
  }

  async remove(id: string) {
    const list = await this.listRepository.findOne({where: {id}});
    if (!list)
    {
      throw new NotFoundException(`Board với ID "${id}" không tồn tại`);
    }
    await this.listRepository.remove(list);
    return { message: `Đã xóa thành công list có ID ${id}` };
  }
}
