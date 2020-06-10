import { Core } from "./core";

/**
 * This is a helper Class for anything what is not needed a system
 */
export class Utils {
    constructor(protected core: Core) {
        //Todo
    }

    // Command Helpers
    sendError(playerMp: PlayerMp, error: string, correctWay: string) {
        playerMp.outputChatBox(`Error: ${error}`);
        if(correctWay !== undefined) playerMp.outputChatBox(`Usage: /${correctWay}`);
    }
    sendSuccess(playerMp: PlayerMp, success: string) {
        playerMp.outputChatBox(`Success: ${success}`);
    }
}