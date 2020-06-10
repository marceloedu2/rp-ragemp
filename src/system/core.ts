import { Connection, EntityManager } from "typeorm";
import { PlayerController } from "./player/playerController";
import { EventHandler } from "./eventHandler";
import { Utils } from "./utils";
import { CommandController } from "./player/commandController";
import { VehicleController } from "./vehicle/vehicleController";

/**
 * Core class is just a simple class who manage all other classes.
 * if you create a new class, you can add this here.
 * constructor function in class's will automaticly called when the object (class) will be created.
 * so if you do `const core: Core = new Core();` (we have already done this on index.ts) then constructor() will called.
 * hint: when you create a class dont forget to set the constructor paramter for this core class.
 * example: `this.eventHandle = new EventHandler(this);` this means you give the class'EventHandler' the Core class
 * and you can access in eventhandler all variable from core class if the variables are public
 * see eventhandler constructor paramter for example how todo this in your new class.
 * ** more you can read in the forum thread i've created and linked in github repository.
 * 
 * ----
 * 
 * in the core class you can simple store main Variables to access from other classes
 */

export class Core {

    //Main
    public Entity: EntityManager;
    public Connection: Connection;

    //General
    public eventHandle: EventHandler;
    public utils: Utils;

    //Player
    public playerController: PlayerController;
    public commandController: CommandController;

    //Vehicle
    public vehicleController: VehicleController;

    //Stuffs



    constructor(databaseConnection : Connection) {

        // Initialize Main
        this.Connection = databaseConnection;
        this.Entity = databaseConnection.manager;

        // Initialize General
        this.eventHandle = new EventHandler(this);
        this.utils = new Utils(this);

        // Initialize Player
        this.playerController = new PlayerController(this);
        this.commandController = new CommandController(this);

        // Initialize Vehicle
        this.vehicleController = new VehicleController(this);
        
        // Initialize Stuffs
        // ..
        
        
        console.log(`[BASE-TPL] All systems loaded and ready. Database: ${databaseConnection.isConnected}`);
    }

    /**
     * we need this because i use mongodb as database driver.
     * typeORM need another save method from the entity for mongoDB
     * mysql should use the EntityManager to save the entity in database
     * if you use another driver as mongoDb or MySQL please goto https://typeorm.io/
     * you can use this function or directly in the script.
     * i prefer directly in the script wherever i need it. (look at onPlayerRegister in PlayerController)
     * @param entity 
     */
    async entitySave(entity: any) {
        if(this.Connection.options.type == "mongodb") {
            try {
                await this.Connection.mongoManager.save(entity);
            } catch(error) {
                console.log(`entitySave throws errors: \n${error}`);
            }
        } else {
            try {
                await this.Entity.save(entity);
            } catch(error) {
                console.log(`entitySave throws errors: \n${error}`);
            }
        }
    }
}