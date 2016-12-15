<?php

$page = $_GET['page'] ?? 'main';

$routes = [
    'main' => array('model' => 'Model', 'view' => 'View', 'controller' => 'Controller'),
    'wines' => array('model' => 'WinesModel', 'view' => 'WinesView', 'controller' => 'WinesController'),
];

foreach ($routes as $key => $components) {
    if ($page == $key) {

        $model = $components['model'];
        $view = $components['view'];
        $controller = $components['controller'];

        require __DIR__ . '/Class/' . $model . '.php';
        require __DIR__ . '/Class/' . $view . '.php';
        require __DIR__ . '/Class/' . $controller . '.php';

        $m = new $model();
        $v = new $view($m);
        $c = new $controller($m);

        print $v->output();
    }
}
