<?php
define('CLASSES', __DIR__ . '/Classes/');
define('TEMPLATES', __DIR__ . '/Templates/');

$page = $_GET['page'] ?? 'main';

$routes = [
    'main' => array('model' => 'Model', 'view' => 'View', 'controller' => 'Controller'),
    'wines' => array('model' => 'WinesModel', 'view' => 'WinesView', 'controller' => 'WinesController'),
];

if (array_key_exists($page, $routes)) {
    $classes = $routes[$page];
    $model = $classes['model'];
    $view = $classes['view'];
    $controller = $classes['controller'];

    require CLASSES . 'Model/' . $model . '.php';
    require CLASSES . 'View/' . $view . '.php';
    require CLASSES . 'Controller/' . $controller . '.php';

    $m = new $model();
    $v = new $view($m);
    $c = new $controller($m);

    print $v->output();
}
else {
    print '<p>This is fine.</p>';
}
