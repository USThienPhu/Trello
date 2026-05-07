import {
  Injectable,
  CanActivate,
  ExecutionContext,
  ForbiddenException,
} from '@nestjs/common';
import { BoardsService } from '../boards/boards.service';
import { ListsService } from './lists.service';

@Injectable()
export class ListOwnershipGuard implements CanActivate {
  constructor(
    private listsService: ListsService,
    private boardsService: BoardsService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const user = request.user;
    const listId = request.params.id;

    if (!user || !user.id) {
      throw new ForbiddenException('User not authenticated');
    }

    if (user.role === 'admin') {
      return true;
    }

    const boardId = await this.listsService.findListBoardId(listId);
    const ownerId = await this.boardsService.findBoardOwnerId(boardId);

    if (ownerId !== user.id) {
      throw new ForbiddenException('You do not own this list');
    }

    return true;
  }
}
