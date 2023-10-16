<?php

namespace vendor\Biblioteca;

class Libro
{
    public $Id;
    public $Titulo;
    public $Edicion;
    public $Isbn;
    public $Genero;
    public $EditorialId;

    // no forma parte de la tabla libros
    // solo será utilizada en php
    public $Editorial;
    public $Autores = array();
}