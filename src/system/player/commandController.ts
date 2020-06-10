import { Core } from "../core";
import { Vehicle } from "../../entity/Vehicle.entity";
import { Player } from "../../entity/Player.entity";

export class CommandController {
    constructor(protected core: Core) {}

    onCommand(playerMp: PlayerMp, command: string) {
        if(command !== undefined) {
            const args = command.split(/[ ]+/);
            if(args[0] !== undefined) {
                switch(args[0]) {
                    case "help":
                        playerMp.outputChatBox(`command /help is empty..`);
                    break;
                    case "login":
                        var username: string = args[1];
                        var password: string = args[2];

                        if(username == undefined || password == undefined) return this.core.utils.sendError(playerMp, `You must fill your arguments`, `login [username] [password]`);

                        this.core.playerController.onPlayerLogin(playerMp, username, password);
                    break;
                    case "register":
                        var username: string = args[1];
                        var password: string = args[2];
                        if(username == undefined || password == undefined) return this.core.utils.sendError(playerMp, `You must fill your arguments`, `register [username] [password]`);

                        this.core.playerController.onPlayerRegister(playerMp, username, password);
                    break;
                    case "respawn":
                        this.core.playerController.playerSpawn(playerMp);
                        playerMp.outputChatBox("you should now respawned");
                    break;
                    case "save":
                        playerMp.outputChatBox("see server console");
                        console.log(playerMp.position);
                    break;
                    case "vehicle":
                        var name: string = args[1];
                        if(name == undefined) {
                            playerMp.outputChatBox("you should give me a modelname ");
                            return false;
                        }

                        let player: Player = this.core.playerController.get(playerMp);


                        //check if player have already an vehicle created:
                        for(let vIndex in this.core.vehicleController.vehicles) {
                            if(this.core.vehicleController.vehicles[vIndex].owner == player.id) {
                                this.core.vehicleController.vehicles[vIndex].mp.destroy(); // destroy vehicle in ragemp
                                delete this.core.vehicleController.vehicles[vIndex]; // destroy/delete vehicle from array
                                // after deleting some items in a array, we got an empty item in our array
                                // so we need recreate or filter that array for empty items
                                this.core.vehicleController.vehicles = this.core.vehicleController.vehicles.filter(Vehicle => Vehicle);
                            }
                        }


                        const vehicle = new Vehicle();
                        vehicle.model = name;
                        vehicle.position = playerMp.position;
                        vehicle.color1 = Math.floor(Math.random() * 240);
                        vehicle.color2 = Math.floor(Math.random() * 240);
                        vehicle.fuel = 60.0; // 60 Liter 
                        vehicle.owner = player.id;
                        this.core.vehicleController.create(vehicle, true, playerMp);

                    break;
                    default: //default will be called if any other cases is not matching 
                        playerMp.outputChatBox(`your command ${args[0]} not exists. you get help with command: '/help'`);
                    break;

                } 
            }
        }
    }
}