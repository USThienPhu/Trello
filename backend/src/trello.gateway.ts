import {
  WebSocketGateway,
  WebSocketServer,
  SubscribeMessage,
  OnGatewayConnection,
  OnGatewayDisconnect
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { JwtService } from '@nestjs/jwt';

@WebSocketGateway({
  cors: { origin: '*' }, // Cho phép Flutter kết nối
})
export class TrelloGateway implements OnGatewayConnection, OnGatewayDisconnect {
  @WebSocketServer()
  server: Server;

  constructor(private jwtService: JwtService) {}

  async handleConnection(client: Socket) {
    try {
      const token = client.handshake.auth.token;
      const payload = await this.jwtService.verifyAsync(token);
      client.data.user = payload;
      console.log(`Client connected: ${client.id}`);
    } catch (e) {
      client.disconnect();
    }
  }

  handleDisconnect(client: Socket) {
    console.log(`Client disconnected: ${client.id}`);
  }

  @SubscribeMessage('joinBoard')
  handleJoinBoard(client: Socket, boardId: string) {
    client.join(`board_${boardId}`);
    return { event: 'joined', data: boardId };
  }

  @SubscribeMessage('leaveBoard')
  handleLeaveBoard(client: Socket, boardId: string) {
    client.leave(`board_${boardId}`);
    return { event: 'left', data: boardId };
  }

  emitCardCreated(boardId: string, card: any) {
    this.server.to(`board_${boardId}`).emit('cardCreated', card);
  }

  emitCardUpdated(boardId: string, card: any) {
    this.server.to(`board_${boardId}`).emit('cardUpdated', card);
  }

  emitCardDeleted(boardId: string, cardId: string) {
    this.server.to(`board_${boardId}`).emit('cardDeleted', { id: cardId });
  }

  emitCardMoved(boardId: string, card: any) {
    this.server.to(`board_${boardId}`).emit('cardMoved', card);
  }
}