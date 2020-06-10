import { Core } from "./core";

/**
 * This is a simple event handler.
 * With this class you must/should put alle RageMP Events and call them, where they must going.
 * like playerReady will be called, when the player is connect to server and the client downloads are ready.
 * then we call him, that this event should go to onPlayerConnected in PlayerController.
 * so we have a nice dashboard over all functions.
 */
export class EventHandler {
    constructor(protected core: Core) {

        //player stuffs
        mp.events.add("playerReady", (playerMp: PlayerMp) => { this.core.playerController.onPlayerConnected(playerMp); });
        mp.events.add("playerQuit", (playerMp: PlayerMp) => { this.core.playerController.onPlayerDisconnect(playerMp); });
        mp.events.add("playerDeath", (playerMp: PlayerMp, reason: number, killer: PlayerMp) => { this.core.playerController.onPlayerDeath(playerMp, reason, killer); });
        mp.events.add("playerCommand", (playerMp: PlayerMp, command: string) => { this.core.commandController.onCommand(playerMp, command); });
        mp.events.add("playerExitVehicle", (playerMp: PlayerMp, vehicleMp: VehicleMp) => { this.core.playerController.onPlayerExitVehicle(playerMp, vehicleMp); });
        mp.events.add("playerEnterVehicle", (playerMp: PlayerMp, vehicleMp: VehicleMp) => { this.core.playerController.onPlayerEnterVehicle(playerMp, vehicleMp); });
    }
}