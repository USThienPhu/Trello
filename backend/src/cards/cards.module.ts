import { Module } from '@nestjs/common';
import { CardsService } from './cards.service';
import { CardsController } from './cards.controller';
import { CardOwnershipGuard } from './cards-owner.guard';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Card } from './entities/card.entity';
import { BoardsModule } from '../boards/boards.module';

@Module({
  imports: [TypeOrmModule.forFeature([Card]), BoardsModule],
  controllers: [CardsController],
  providers: [CardsService, CardOwnershipGuard],
})
export class CardsModule {}
