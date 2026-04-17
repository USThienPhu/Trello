import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, ManyToOne, JoinColumn } from 'typeorm';
import {Board} from '../../boards/entities/board.entity';

@Entity('lists')
export class List {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    title: string;

    @Column()
    board_id: string;

    @Column()
    position: number;

    @CreateDateColumn({ type: 'timestamptz' })
    create_at: Date;

    @ManyToOne(() => Board)
    @JoinColumn({
        name: 'board_id',
        referencedColumnName: 'id'
    })
    board: Board;
}
