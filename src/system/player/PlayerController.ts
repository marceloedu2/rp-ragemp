import { Core } from "../core";
import { Player } from "../../entity/Player.entity";
import { isNullOrUndefined } from "util";

/**
 * The PlayerController. everything that has to do with the player has to go in here
 */
export class PlayerController {

    public players: Player[] = new Array<Player>(); // Store player data from database in this Player array
    public playerStartPosition: Vector3Mp[] = new Array<Vector3Mp>(); // player spawn positions in array, so we can use it like a random spawner

    constructor(protected core: Core) {
        //prepare start positions for the player
        this.playerStartPosition.push(new mp.Vector3(150.126, -754.591, 262.865)); // [FIB Roof]
        this.playerStartPosition.push(new mp.Vector3(346.05462646484375, -741.6575927734375, 29.269922256469727)); // [in the near of FIB Roof]
        this.playerStartPosition.push(new mp.Vector3(363.3694152832031, -580.3405151367188, 28.838319778442383)); // [in the near of FIB Roof]
    }

    /**
     * to get the player object from the database with PlayerMp Class
     * this you must call everytime if you need the player data from database.
     * because we store this data in this.players array so we dont need check database everytime.
     * 
     * @param playerMp 
     */
    get(playerMp: PlayerMp): Player {
        if(!isNullOrUndefined(this.players[playerMp.id])) {
            return this.players[playerMp.id];
        }
        return undefined;
    }

    /**
     * onPlayerConnected is controlled by eventHandler.
     * this function will be called when the player connected. 
     * @param playerMp 
     */
    onPlayerConnected(playerMp: PlayerMp) {

        // you should here reset anything you can from the player
        // weapons reset, money reset and anything else.
        // set the player position if you want or disable him to control

        playerMp.outputChatBox(`Hey ${playerMp.name} and welcome to Base Template.`);
        playerMp.outputChatBox(`you can use /login or /register for Authentication your identity.`);

        // Kick the user if we have trouble with the Database connection.
        if(!this.core.Connection.isConnected) {
            playerMp.outputChatBox(`We have an error with our Database.`);
            playerMp.outputChatBox(`You will be automaticly kicked from this server.`);
            playerMp.kick("Database error"); // Todo KickHandler
        }

        console.log(`New Player ${playerMp.name}[${playerMp.id}] now connected`);
    }

    /**
     * onPlayerDisconnect will called when the player disconnected from the server
     * we save then all changes from his entity in the database.
     * and delete his entry from our array we defined (this.players)
     * @param playerMp 
     */
    async onPlayerDisconnect(playerMp: PlayerMp) {
        if(!isNullOrUndefined(this.players[playerMp.id])) {
            await this.core.Entity.update( Player, {username: this.players[playerMp.id].username}, this.players[playerMp.id]);
            delete this.players[playerMp.id];
        }
    }

    /**
     * onPlayerLogin will called when the player use the command /login [username] [password]
     * @param playerMp ragemp player object
     * @param inputUsername this is the username
     * @param inputPassword this is the password
     */
    async onPlayerLogin(playerMp: PlayerMp, inputUsername: string, inputPassword: string) {
        //Todo
        if(!isNullOrUndefined(this.players[playerMp.id])) {
            // player already logged in
            return false;
        }


        const player = await this.core.Entity.findOne(Player, { username: inputUsername});
        if(isNullOrUndefined(player)) {
            //player is not found in database
            playerMp.outputChatBox("username not found");
            return false;
        }

        if(player.password != inputPassword) {
            //the password does not match
            playerMp.outputChatBox("password does not match.");
            return false;
        }

        // all fine we continue with 
        // creating the player in our array
        // and call the spawn for him
        this.players[playerMp.id] = player;
        this.playerSpawn(playerMp);
        playerMp.outputChatBox(`Welcome back, ${player.username}`);
    }

    async onPlayerRegister(playerMp: PlayerMp, inputUsername: string, inputPassword: string) {
        if(!isNullOrUndefined(this.players[playerMp.id])) {
            // player already logged in
            return false;
        }


        const prePlayer = await this.core.Entity.findOne(Player, { username: inputUsername});
        if(!isNullOrUndefined(prePlayer)) {
            //player is already registered
            playerMp.outputChatBox("Username is already registered with this Server"); 
            return false;
        }

        //Create the new Player Class and set the variables
        let player = new Player();
        player.username = inputUsername;
        player.password = inputPassword;
        player.money = 10000;
        player.admin = 0;

        // Store the new player in this.players array
        this.players[playerMp.id] = player;

        // and save to database directly
        // in my case i use mongoDB so i must use mongoManger
        await this.core.Connection.mongoManager.save(player);
        // with MySQL you should use:
        //await this.core.Entity.save(player);


        playerMp.outputChatBox(`Welcome, ${player.username}`);
        console.log(`new player [${player.username}] from ${playerMp.name} was registered`);
    }

    /**
     * do with the playerSpawn everything you want... give weapons, set skins, set position etc...
     * @param playerMp 
     */
    playerSpawn(playerMp: PlayerMp) {
        // Generate a random number from 0 to maximum length of this.playerStartPosition array
        const randomNumber: number = Math.floor(Math.random() * this.playerStartPosition.length);
        playerMp.position = this.playerStartPosition[randomNumber]; // set the player position of the number we have generated
        //console.log(`[DEBUG] randomNumber:${randomNumber} -> ${this.playerStartPosition[randomNumber]}`);
    }

    
    onPlayerDeath(playerMp: PlayerMp, reason: number, killer: PlayerMp) {
        //standard way
        // if(killer !== undefined) {
        //     playerMp.outputChatBox(`you was killed from ${killer.name} - wait 5 seconds to spawn`);
        // } else {
        //     playerMp.outputChatBox(`you are death - wait 5 seconds to spawn`);
        // }

        //inline way
        playerMp.outputChatBox((killer !== undefined ? `you was killed by ${killer.name}` : `you are death`) + ` - Respawn in 5 Seconds`);

        setTimeout( () => {
            playerMp.health = 100;
            this.playerSpawn(playerMp);
        }, 5000);
    }

    /*
        this function will be improved soon.
    */
    onPlayerExitVehicle(playerMp: PlayerMp, vehicleMp: VehicleMp) {
        vehicleMp.engine = false;
    }
    
    /*
        this function will be improved soon.
    */
    onPlayerEnterVehicle(playerMp: PlayerMp, vehicleMp: VehicleMp) {
        vehicleMp.engine = true;
    }
}