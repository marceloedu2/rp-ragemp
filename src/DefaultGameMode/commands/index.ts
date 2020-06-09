mp.events.addCommand('hp', player => {
  player.health = 50
})

mp.events.addCommand('armor', player => {
  player.armour = 50
})

mp.events.addCommand('kill', player => {
  player.health = 0
})
function setArmour(player: PlayerMp) {
    player.armour = 50;
}
mp.events.addCommand('armour', setArmour);
