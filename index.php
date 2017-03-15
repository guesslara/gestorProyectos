<?php
    //inclusion de la libreria del template
    include "libs/tpl.lib.php";
    
    $tpl = new Template('modulos/mod_proyectos/views');

    $tpl->set_filenames(array('index' => 'test'));
    $tpl->assign_vars(array(
	    'TEST' => "Hola Mundo!!!"
	));
    $tpl->pparse('index');
    // header("Location: modules/mod_proyectos/index.php?");
    // exit();


?>