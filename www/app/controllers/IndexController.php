<?php

namespace Controllers;

use Models\Technology;

class IndexController extends ControllerBase {

    public function indexAction() {
		$this->view->setVar('technologies', Technology::find());
    }
}