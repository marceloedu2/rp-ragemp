mp.events.add('OnPlayerLoginAttempt', (player, username, password) => {
  console.log({ player, username, password })
})
