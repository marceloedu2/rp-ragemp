import { Entity, Column, ObjectIdColumn } from "typeorm";

@Entity()
export class Vehicle {
    @ObjectIdColumn()
    id: string;

    @Column()
    model: string;

    @Column()
    position: Vector3Mp;

    @Column()
    color1: number = 0;
    @Column()
    color2: number = 0;

    @Column()
    fuel: number;

    //we want store the playerID from database in there.
    // mongo db you already know uses ObjectID, but if you are using mysql you just need `number` .
    @Column()
    owner: string;

    // we store here the ragemp vehicle object so we can access in there...
    mp: VehicleMp;
}