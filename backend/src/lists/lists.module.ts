import { Module } from '@nestjs/common';
import { ListsService } from './lists.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ListsController } from './lists.controller';
import {List } from './entities/list.entity';

@Module({
  imports: [TypeOrmModule.forFeature([List])],
  controllers: [ListsController],
  providers: [ListsService],
})
export class ListsModule {}
