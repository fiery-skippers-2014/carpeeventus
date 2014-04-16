<!DOCTYPE html>
<html lang="en">
<head>
     <style>
      html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
  <!--
    normalize.css removes cross-browser differences in defaults, e.g.,
    differences in how form elements appear between Firefox and IE
    See: http://necolas.github.com/normalize.css/
  -->
  <link rel="stylesheet" href="/css/normalize.css">
  <!--
    application.css is where you put your styles
  -->
  <link rel="stylesheet" href="/css/application.css">

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="/js/application.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
  <title></title>
</head>
<body>

  <%= yield %>
</body>
</html>

