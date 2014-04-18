window.fbAsyncInit = function() {
  FB.init({
    appId      : '279371442222359',
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
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

  // Load the SDK asynchronously
  (function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
  }(document));

  // Here we run a very simple test of the Graph API after login is successful.
  // This testAPI() function is only called in those cases.
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

