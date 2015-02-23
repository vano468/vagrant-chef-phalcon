<?php

namespace Models;

class Technology extends \Phalcon\Mvc\Model {

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     * Independent Column Mapping.
     */
    public function columnMap() {
        return array(
            'id' => 'id',
            'name' => 'name'
        );
    }
}