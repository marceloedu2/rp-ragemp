$('#loginButton').click(() => {

    $('.alert').remove(); //Remove any alerts when we attempt to login/register
    mp.trigger('loginInformationToServer', $('#loginUsernameText').val(), $('#loginPasswordText').val());
});

$('#registerButton').click(() => {

    $('.alert').remove(); //Remove any alerts when we attempt to login/register
    mp.trigger('registerInformationToServer', $('#registerUsernameText').val(), $('#registerPasswordText').val());
});