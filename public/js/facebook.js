window.fbAsyncInit = function() {
  FB.init({
    appId      : '279371442222359',
    status     : true,
    cookie     : true,
    xfbml      : true
  });

  FB.getLoginStatus(function(response) {
  if (response.status === 'connected') {
    var uid = response.authResponse.userID;
    var accessToken = response.authResponse.accessToken;
  } else if (response.status === 'not_authorized') {

  } else {
  }
 });

  FB.Event.subscribe('auth.authResponseChange', function(response) {

    if (response.status === 'connected') {
      testAPI();
    } else if (response.status === 'not_authorized') {
      FB.login();
    } else {
      FB.login();
      }
  });
  };

  (function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
  }(document));

  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Good to see you, ' + response.name + '.');
      var token = FB.getAccessToken()
      var user_data = {
        name: response.name,
        facebook_id: response.id,
        token: token
      }
      var jxqr = $.ajax({
        url: '/user',
        type: 'POST',
        data: user_data})
        .done(function(data){
          $('.profile').html(data)
      })
    });
  $('body').on('click', '#logout', function() {FB.logout()})
  }

