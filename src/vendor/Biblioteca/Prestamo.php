<?php

namespace vendor\Biblioteca;

class Prestamo
{
    public $Id;
    public $FechaDeSalida;
    public $FecheDeRegreso;
    public $Tipo; // Interno, Externo
    public $UsuarioId;
    public $ClienteId;

    // solo para uso en php
    public $Usuario;
    public $Cliente;
    public $Ejemplares = array();
}