import { Module } from '@nestjs/common';
import { ListsService } from './lists.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ListsController } from './lists.controller';
import { ListOwnershipGuard } from './lists-owner.guard';
import {List } from './entities/list.entity';
import { BoardsModule } from '../boards/boards.module';

@Module({
  imports: [TypeOrmModule.forFeature([List]), BoardsModule],
  controllers: [ListsController],
  providers: [ListsService, ListOwnershipGuard],
  exports: [ListsService],
})
export class ListsModule {}
