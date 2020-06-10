import { Core } from "../core";
import { Vehicle } from "../../entity/Vehicle.entity";


export class VehicleController {
    
    public vehicles: Vehicle[] = new Array<Vehicle>();
    
    constructor(protected core: Core) {
        //read all database Vehicles
        this.getVehicles();
        // check every 1500ms the vehicle states...
        setInterval( () => {
            this.vehicleInteraction();
        }, 1500);
    }

    async getVehicles() {
        const vehicles: Vehicle[] = await this.core.Entity.find(Vehicle);

        for(let vehicle of vehicles) {
            this.create(vehicle);
        }
    }

    findVehicleMp(vehicle: Vehicle) : VehicleMp {
        // Todo 

        //maybe this works... not working ..
        // if(mp.vehicles[vehicle.id] !== undefined) {
        //     return mp.vehicles[vehicle.id];
        // }
        return undefined;
    }

    /**
     * get the vehicle database object from array
     * @param vehicleMp 
     */
    getVehicle(vehicleMp: VehicleMp): Vehicle {
        for(let vehicle of this.vehicles) {
            if(vehicle.mp.id == vehicleMp.id) {
                return vehicle;
            }
        }
        return undefined;
    }

    create(vehicle: Vehicle, pushPlayer?: boolean, playerMp?: PlayerMp) {
        let tempVehicle = mp.vehicles.new(mp.joaat(vehicle.model), vehicle.position);
        tempVehicle.setColor(vehicle.color1, vehicle.color2);

        tempVehicle.engine = true;
        vehicle.mp = tempVehicle; // store ragemp vehicleMp class in our vehicle class so we can access the ragemp vehicleMp class from our vehicle class and change anything we wont

        this.vehicles.push(vehicle);

        if(pushPlayer) {
            setTimeout( () => {
                playerMp.putIntoVehicle(tempVehicle, 0);
            }, 1000);
        }
    }

    // a simple fuel system for vehicles
    /*
        this function will be improved soon.
    */
    vehicleInteraction() {
        if(this.vehicles !== undefined) {
            for(let vehicle of this.vehicles) {
                if(vehicle !== undefined) {
                    if(vehicle.mp.engine) {
                        if(vehicle.fuel >= 0) {
                            let oldFuel = vehicle.fuel;
                            vehicle.fuel = (vehicle.fuel - 0.02);
                            console.log(`vehicle old fuel: ${oldFuel} new: ${vehicle.fuel}`);
                        } else {
                            vehicle.mp.engine = false;
                        }
                    } else {
                        console.log(`vehicle [${vehicle.mp.id}] engine [${vehicle.mp.engine}] - what now?`);
                    }
                }
            }
        }
    }
}