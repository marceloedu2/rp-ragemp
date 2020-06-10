var loginBrowser = mp.browsers.new('package://Login/Login.html');
mp.gui.cursor.show(true, true);

mp.events.add('loginInformationToServer', (username, password) => {
    mp.events.callRemote('OnPlayerLoginAttempt', username, password);
});

mp.events.add('registerInformationToServer', (username, password) => {
    mp.events.callRemote('OnPlayerRegisterAttempt', username, password);
});

mp.events.add('LoginResult', (result) => {
    if (result == 1) {
        //Success we destroy the loginBrowser for this player as we don't need it anymore
        loginBrowser.destroy();
        mp.gui.cursor.show(false, false);

        mp.gui.chat.push("You have successfully logged in.");
    }
    else {
        //Failed we just send a message to the player saying he provided incorrect info
        mp.gui.chat.push('Incorrect password or username.');

        //Here you can be creative and handle it visually in your webpage by using the (browser).execute or loginBrowser.execute in our case to execute a js code in your webpage
        //Example:
        loginBrowser.execute('var alertElement = $(\' <div class= "alert alert-danger">Incorrect username or password.</div > \'); \
            $(\'.jumbotron\').append(alertElement);');
    }
});