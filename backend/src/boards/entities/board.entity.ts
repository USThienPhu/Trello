import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, ManyToOne, JoinColumn } from 'typeorm';
import { User } from '../../users/entities/user.entity'; // Import Entity User

@Entity('boards')
export class Board {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  title: string;

  @Column({ nullable: true })
  description: string;

  @Column()
  visibility: string; 

  @Column()
  owner_id: string;

  @Column({ default: '#FFFFFF' })
  background_color: string;

  @CreateDateColumn({ type: 'timestamptz' })
  create_at: Date;


  @ManyToOne(() => User )
  @JoinColumn({ 
    name: 'owner_id',
    referencedColumnName: 'id'
   }) // Chỉ định chính xác cột owner_id làm khóa ngoại
  owner: User;
} 