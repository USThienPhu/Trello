import { Injectable,  NotFoundException } from '@nestjs/common';
import { CreateCardDto } from './dto/create-card.dto';
import { UpdateCardDto } from './dto/update-card.dto';
import {Card} from '../cards/entities/card.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class CardsService {
  constructor(
    @InjectRepository(Card)
    private cardsRepository: Repository<Card>,
  ) {}

  async create(createCardDto: CreateCardDto) {
    const card = this.cardsRepository.create(createCardDto);
    return await this.cardsRepository.save(card);
  }

  async findAllByList(listId: string) {
    return await this.cardsRepository.find({
      where: { list_id: listId },
      order: { position: 'ASC' }, // Trello cần sắp xếp theo vị trí thẻ
    });
  }

  async findOne(id: string) {
    const card =  await this.cardsRepository.findOne({
      where: {id}
    });
    if (!card)
    {
      throw new NotFoundException(`Card với ID "${id}" không tồn tại`);
    }

    return card;
  }

  async update(id: string, updateCardDto: UpdateCardDto) {
    const card = await this.cardsRepository.preload({
      id: id,
      ...updateCardDto,
    });
    if (!card) throw new NotFoundException(`Card #${id} not found`);
    return this.cardsRepository.save(card);
  }

  async remove(id: string) {
    const card = await this.cardsRepository.findOne({
      where: {id}
    });
    if (!card)
    {
      throw new NotFoundException(`Card với ID "${id}" không tồn tại`);
    }

    await this.cardsRepository.remove(card)
    return { message: `Đã xóa thành công bảng có ID ${id}` };
  }
}
