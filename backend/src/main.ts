import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder } from '@nestjs/swagger';
import { SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await(NestFactory.create(AppModule));

  // Giúp tự động loại bỏ các field không được định nghĩa trong DTO
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));

  // Swagger configuration
  const config = new DocumentBuilder()
    .setTitle('Trello Clone API')
    .setDescription('API documentation for Trello Clone application')
    .setVersion('1.0')
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  const port = process.env.PORT || 3000;

  await app.listen(port, '0.0.0.0');

  console.log(`Application is running on: ${port}`);
}
bootstrap();