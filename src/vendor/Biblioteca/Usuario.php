<?php

namespace vendor\Biblioteca;

class Usuario
{
    public $Id;
    public $Alias;
    public $Contrasenia;
    public $CorreoElectronico;
    public $Recordatorio;
    public $Nombres;
    public $Apellidos;

    // solo para uso en php
    public $Prestamos = array();
}