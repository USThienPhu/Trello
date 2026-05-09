import { Injectable,  NotFoundException, InternalServerErrorException } from '@nestjs/common';
import { CreateCardDto } from './dto/create-card.dto';
import { UpdateCardDto } from './dto/update-card.dto';
import {Card} from '../cards/entities/card.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { TrelloGateway } from '../trello.gateway';
import { ListsService } from '../lists/lists.service';

@Injectable()
export class CardsService {
  constructor(
    @InjectRepository(Card)
    private cardsRepository: Repository<Card>,
    private listsService: ListsService,
    private trelloGateway: TrelloGateway,
  ) {}

  async create(createCardDto: CreateCardDto) {
    try {
      console.log(createCardDto);
      const newCard = this.cardsRepository.create(createCardDto);
      const savedCard = await this.cardsRepository.save(newCard);

      // Emit socket event
      const boardId = await this.getBoardIdByList(createCardDto.list_id);
      if (boardId && this.trelloGateway) {
        this.trelloGateway.emitCardCreated(boardId, savedCard);
      }

      return savedCard;
    } catch(error){
      throw new InternalServerErrorException('Lỗi truy vấn cơ sở dữ liệu: ' + error.message);
    }
  }

  // async findAllByList(listId: string) {
  //   try {
  //     const result = await this.cardsRepository.find({
  //       where: {list_id: listId},
  //       order: {position: "ASC"},
  //     });

  //     if (!result || result.length === 0)
  //     {
  //       throw new NotFoundException(`Card với ID "${listId}" không tồn tại`);
  //     }

  //     return result;
  //     } catch(error){
  //     throw new InternalServerErrorException('Lỗi truy vấn cơ sở dữ liệu: ' + error.message);
  //   } 
  // }

  async findAll() {
    try {
      const result = await this.cardsRepository.find({
        order: {position: "ASC"},
      });

      if (!result || result.length === 0)
      {
        throw new NotFoundException(`Không tồn tại card nào cả`);
      }

      return result;
      } catch(error){
      throw new InternalServerErrorException('Lỗi truy vấn cơ sở dữ liệu: ' + error.message);
    } 
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
    const savedCard = await this.cardsRepository.save(card);

    // Emit socket event
    const boardId = await this.findCardBoardId(id);
    if (boardId && this.trelloGateway) {
      this.trelloGateway.emitCardUpdated(boardId, savedCard);
    }

    return savedCard;
  }

  async remove(id: string) {
    const card = await this.cardsRepository.findOne({
      where: {id}
    });
    if (!card)
    {
      throw new NotFoundException(`Card với ID "${id}" không tồn tại`);
    }

    // Get boardId before deleting
    const boardId = await this.findCardBoardId(id);

    await this.cardsRepository.remove(card)

    // Emit socket event
    if (boardId && this.trelloGateway) {
      this.trelloGateway.emitCardDeleted(boardId, id);
    }

    return { message: `Đã xóa thành công bảng có ID ${id}` };
  }

  async findCardBoardId(cardId: string): Promise<string> {
    const card = await this.cardsRepository.findOne({
      where: { id: cardId },
      relations: ['list', 'list.board'],
    });
    if (!card) {
      throw new NotFoundException(`Card với ID "${cardId}" không tồn tại`);
    }
    return card.list.board_id;
  }

  private async getBoardIdByList(listId: string): Promise<string> {
    return await this.listsService.findListBoardId(listId);
  }
}
