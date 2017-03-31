<!DOCTYPE html>
<html lang="es">
<head>
	<title><?=$titulo;?></title>
	<meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login Page</title>
    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<?=base_url();?>dist/assets/lib/bootstrap/css/bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?=base_url();?>dist/assets/lib/font-awesome/css/font-awesome.css">
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<?=base_url();?>dist/assets/css/main.css">
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="<?=base_url();?>dist/assets/lib/metismenu/metisMenu.css">
    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="<?=base_url();?>dist/assets/lib/onoffcanvas/onoffcanvas.css">
    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="<?=base_url();?>dist/assets/lib/animate.css/animate.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->		
</head>
<body class="login">
<?php
	$username = array('name' => 'username', 'placeholder' => 'nombre de usuario','class' => 'form-control top');
	$password = array('name' => 'password',	'placeholder' => 'introduce tu password','class' => 'form-control bottom');
	$submit = array('name' => 'submit', 'value' => 'Iniciar sesión', 'title' => 'Iniciar sesión','class'=>'btn btn-lg btn-primary btn-block');
?>
<div class="form-signin">
	<div class="text-center">
		<img src="<?=base_url();?>dist/assets/img/logo.png" alt="Metis Logo">
	</div>
	<hr>
	<div class="tab-content">
		<div id="login" class="tab-pane active">
			<?=form_open(base_url().'index.php/login/new_user')?>
				<p class="text-muted text-center">Introduzca su usuario y contraseña</p>
				<!-- <input type="text" placeholder="Usuario" class="form-control top"> -->
				<?=form_input($username)?><p><?=form_error('username')?></p>
				<!-- <input type="password" placeholder="Password" class="form-control bottom"> -->
				<?=form_password($password)?><p><?=form_error('password')?></p>
				<?=form_hidden('token',$token)?>
				<!-- <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button> -->
				<?=form_submit($submit)?>
			<?=form_close()?>
			<?php 
				if($this->session->flashdata('usuario_incorrecto')){
			?>
					<p><?=$this->session->flashdata('usuario_incorrecto')?></p>
			<?php
				}
			?>
		</div>
		<div id="forgot" class="tab-pane">
			<form action="index.html">
				<p class="text-muted text-center">Enter your valid e-mail</p>
				<input type="email" placeholder="mail@domain.com" class="form-control">
				<br>
				<button class="btn btn-lg btn-danger btn-block" type="submit">Recover Password</button>
			</form>
		</div>
	</div>
	<hr>
</div>
	<!--jQuery -->
    <script src="<?=base_url();?>dist/assets/lib/jquery/jquery.js"></script>
    <!--Bootstrap -->
    <script src="<?=base_url();?>dist/assets/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        (function($) {
            $(document).ready(function() {
                $('.list-inline li > a').click(function() {
                    var activeForm = $(this).attr('href') + ' > form';
                    //console.log(activeForm);
                    $(activeForm).addClass('animated fadeIn');
                    //set timer to 1 seconds, after that, unload the animate animation
                    setTimeout(function() {
                        $(activeForm).removeClass('animated fadeIn');
                    }, 1000);
                });
            });
        })(jQuery);
    </script>
</body>
</html>