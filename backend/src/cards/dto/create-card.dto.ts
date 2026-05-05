export class CreateCardDto {
    list_id: string;
    title: string;
    description?: string;
    position?: number;
    due_date?: Date;
}