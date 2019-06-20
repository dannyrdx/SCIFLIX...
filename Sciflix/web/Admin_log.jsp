<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="sciflix.ico"/>
    <title>Admin Login</title><link rel="stylesheet" type="text/css" href="css/login.css">
<script src="register.js"></script></head>
<body>
  <div class="logo"><a href="Sciflix.html">Sciflix</a></div>
    <div class="loginbox">
       <h2>Admin Login</h2>
        <form action = "Admin_login.jsp" method="post">
            <h3>Username</h3>
            <input type="text" name="username" placeholder="Enter Username" required="required">
            <h3>Password</h3>
            <input type="password" name="password" placeholder="Enter Password" required="required" size="8">
            <input type="submit" name="submit" value="Login">
            </form>
       <script>
      history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };
  </script>
   </div>
   </body>
</html>