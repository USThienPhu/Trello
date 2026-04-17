import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, ManyToOne, JoinColumn } from 'typeorm';
import { List } from '../../lists/entities/list.entity'; 

@Entity('CARDS')
export class Card {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  list_id: string;

  @Column('text')
  title: string;

  @Column({ type: 'text', nullable: true })
  description: string;

  @Column('int')
  position: number;

  @Column({ type: 'timestamptz', nullable: true })
  due_date: Date;

  @Column({ default: false })
  is_completed: boolean;

  @CreateDateColumn({ type: 'timestamptz' })
  created_at: Date;

  @ManyToOne(() => List)
  @JoinColumn({ 
    name: 'list_id',
    referencedColumnName: 'id'
   })
  list: List;
}