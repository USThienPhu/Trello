import { Module } from '@nestjs/common';
import { BoardsService } from './boards.service';
import { BoardsController } from './boards.controller';
import { BoardOwnershipGuard } from './boards-owner.guard';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Board } from './entities/board.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Board])],
  controllers: [BoardsController],
  providers: [BoardsService, BoardOwnershipGuard],
  exports: [BoardsService],
})
export class BoardsModule {}
