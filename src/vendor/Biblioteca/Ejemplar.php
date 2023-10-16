<?php

namespace vendor\Biblioteca;

class Ejemplar
{
    public $Id;
    public $LibroId;
    public $FechaDeIngreso;
    public $Costo;
    public $Condiciones;

    // solo para uso en php
    public $Prestamos = array();
}