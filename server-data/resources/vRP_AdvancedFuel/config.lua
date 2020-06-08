petrolCanPrice = 6

lang = "en"
-- lang = "fr"

settings = {}
settings["en"] = {
	openMenu = "Pressione ~g~E~w~ para abrir o menu.",
	electricError = "~r~Você tem um veículo elétrico.",
	fuelError = "~r~Você não está em um bom lugar.",
	buyFuel = "Comprar Gasolina",
	liters = "Litros",
	percent = "Porcento",
	confirm = "Confirmar",
	fuelStation = "Posto de Gasolina",
	boatFuelStation = "Posto de Gasolina | Barco",
	avionFuelStation = "Posto de Gasolina | Avião",
	heliFuelStation = "Posto de Gasolina | Helicóptero",
	getJerryCan = "Pressione ~g~E~w~ para comprar um Galão de Gasolina ("..petrolCanPrice.."R$)",
	refeel = "Pressione ~g~E~w~ para reabastecer seu carrp.",
	YouHaveBought = "Voce comprou ",
	fuel = " Litros de Combustivel",
	price = "preço"
}

settings["fr"] = {
	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
	electricError = "~r~Vous avez une voiture électrique.",
	fuelError = "~r~Vous n'êtes pas au bon endroit.",
	buyFuel = "acheter de l'essence",
	liters = "litres",
	percent = "pourcent",
	confirm = "Valider",
	fuelStation = "Station essence",
	boatFuelStation = "Station d'essence | Bateau",
	avionFuelStation = "Station d'essence | Avions",
	heliFuelStation = "Station d'essence | Hélicoptères",
	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
	YouHaveBought = "Vous avez acheté ",
	fuel = " litres d'essence",
	price = "prix"
}


showBar = true
showText = true


hud_form = 1 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175 
hud_y = 0.885

text_x = 0.2575
text_y = 0.975


electricityPrice = 1 -- NOT RANOMED !!

randomPrice = true --Random the price of each stations
price = 1 --If random price is on False, set the price here for 1 liter