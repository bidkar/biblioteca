<?php

namespace vendor\Biblioteca;

class Cliente
{
    public $Id;
    public $Nombres;
    public $Apellidos;
    public $Sexo;
    public $Tipo; // Alumno, Administrativo o Docente
    public $Telefono;
    public $CorreoElectronico;

    // solo para uso en php
    public $Prestamos = array();
}