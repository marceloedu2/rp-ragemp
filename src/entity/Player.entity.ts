import { Entity, Column, ObjectIdColumn } from "typeorm";

@Entity()
export class Player {
    @ObjectIdColumn()
    id: string;

    @Column()
    username: string;

    @Column()
    password: string;

    @Column()
    admin: number;
    
    @Column()
    money: number;
}
