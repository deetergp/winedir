<?php
define('CLASSES', __DIR__ . '/Classes/');
define('TEMPLATES', __DIR__ . '/Templates/');

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

        require __DIR__ . '/Classes/Model/' . $model . '.php';
        require __DIR__ . '/Classes/View/' . $view . '.php';
        require __DIR__ . '/Classes/Controller/' . $controller . '.php';

        $m = new $model();
        $v = new $view($m);
        $c = new $controller($m);

        print $v->output();
    }
}
