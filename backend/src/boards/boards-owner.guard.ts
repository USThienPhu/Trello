import {
  Injectable,
  CanActivate,
  ExecutionContext,
  ForbiddenException,
} from '@nestjs/common';
import { BoardsService } from './boards.service';

@Injectable()
export class BoardOwnershipGuard implements CanActivate {
  constructor(private boardsService: BoardsService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    const user = request.user;
    const boardId = request.params.id;

    if (!user || !user.id) {
      throw new ForbiddenException('User not authenticated');
    }

    const ownerId = await this.boardsService.findBoardOwnerId(boardId);

    if (ownerId !== user.id) {
      throw new ForbiddenException('You do not own this board');
    }

    return true;
  }
}
