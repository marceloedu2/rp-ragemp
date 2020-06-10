import "reflect-metadata";
import { createConnection } from "typeorm";
import { Core } from "./system/core";

/**
 * we use the typeorm createConnection function at start from the server.
 * if this have error the Core class will not be fired.
 * the Core class is our main class from there all other things will be happens.
 * check core.ts class.
 */

createConnection().then(async connection => {
    const core : Core = new Core(connection);
}).catch( (error) => {
    console.log("TypeORM / Database Connection has errors:");
    console.log(error);
});