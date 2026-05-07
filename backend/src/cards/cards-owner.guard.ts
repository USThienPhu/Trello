import {
  Injectable,
  CanActivate,
  ExecutionContext,
  ForbiddenException,
} from '@nestjs/common';
import { BoardsService } from '../boards/boards.service';
import { CardsService } from './cards.service';

@Injectable()
export class CardOwnershipGuard implements CanActivate {
  constructor(
    private cardsService: CardsService,
    private boardsService: BoardsService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const user = request.user;
    const cardId = request.params.id;

    if (!user || !user.id) {
      throw new ForbiddenException('User not authenticated');
    }

    if (user.role === 'admin') {
      return true;
    }

    const boardId = await this.cardsService.findCardBoardId(cardId);
    const ownerId = await this.boardsService.findBoardOwnerId(boardId);

    if (ownerId !== user.id) {
      throw new ForbiddenException('You do not own this card');
    }

    return true;
  }
}
