# UD3.2 Funciones de Usuario

## Actividades
Crea un directorio `funciones` y desarrolla las siguientes actividades.

## Actividad 2
Escribe una función que al referenciarla muestre tu nombre y apellidos. Referéncialo para que lo muestre 100 veces
```php
<?php
    function muestraNombre() : void
    {
        
    }
```
## Actividad 3 
Escribe una función por pantalla que muestre una pirámide hecha con asteriscos de base 9
```php
    *
   ***
  *****
 *******
*********
```
```php
<?php
    function muestraPiramide() : void
    {
        
    }
```
## Actividad 4
Crea un método sin argumentos que al referenciarlo muestre las tablas de multiplicar del 1 al 10
```php
<?php
    function mostrarTablas() : void
    {
        
    }
```

## Actividad 5
Crea una función con 2 argumentos `a` y `b` que devuelva la suma de dichos argumentos. Referencialo para los siguientes valores:

| A | B |
|---|---|
| 5 | 60 |
| 12 | 45 |
| 56 | 30 |
| 84 |100 |

```php
<?php
    function suma(int $a, int $b) : int 
    {
        
    }
```

## Actividad 6
Crea una función que reciba un parámetro numérico y muestre la tabla de multiplicar de dicho número. Referénciala para que 
muestre las tablas del 7 y del 8.
```php
<?php
    function mostraTablaMultiplicar(int $a) : void 
    {
        
    }
```

## Actividad 7
Escribe una función que acepte 2 argumentos: El caracter que se desea imprimir y el número de veces que se ha de imprimir.
```php
<?php
    function imprime(char $caracter, int $numVeces): void 
    {
            
    }
```
## Actividad 8
Crea 4 funciones denominadas `dividir`, `suma`, `multiplicacion` y `resta` que reciban 2 parámetros numéricos y lleven a cabo
la operación correspondiente. Crea una función calculadora que reciba 2 parámetros númericos representando los operandos
y un parámetro de tipo `string` que represente la operación a realizar (+,-,+,/). Debe devolver el resultado a partir de 
la llamada a las otras funciones.
```php
<?php
    function suma ($operador1, $operador2) : int 
    {
        
    }
     function resta ($operador1, $operador2) : int 
    {
            
    }
    function division ($operador1, $operador2) : int 
    {
                
    }
    function multiplicacion ($operador1, $operador2) : int 
    {
                    
    }
    function calculadora(int $operador1, int $operador2, $operación): int 
    {
            
    }
```
Comprueba su funcionamiento con los siguientes valores:

| **operando A** | **operando B** | **operador** | **resultado** |  
|:---:|:---:|:---:|:---:|
| 12 | 24 | + |**36**|
| 24 | 12 | - |**12**|
| 12 | 3 | / |**4**|
| 2 | 4 | * |**8**|   

## Actividad 9
Diseña una función que retorne el mayor de cuatro números pasados como argumento. 
```php
<?php
    function dameElMayor(int $num1, int $num2, int $num3, int $num4) : int 
    {
        
    }
```

## Actividad 10
Crea un script `connection_pdo.php` y declara una función que al referenciarla devuelva un objeto de tipo ``PDO`` 
con la conexión a la base de datos establecida
```php
<?php
    function crearConexion() : ?PDO 
    {
        require __DIR__ . "/../resources/database-params.php";
        try {
        
            $usuario = $dataBaseParams['user'];
            $contraseña =  $dataBaseParams['password'];
            $ipServidor = $dataBaseParams['host'];
            $databaseName = $dataBaseParams['database'];
            $conexión = new PDO("mysql:host=$ipServidor;dbname=$databaseName;charset=utf8", $usuario, $contraseña);
        
        } catch (PDOException $e) {
     
            echo "Error en la conexión con la Base de datos " . $e->getMessage() . "<br/>";
            return null;
     
        }
        return $conexión;
    }
```

## Actividad 11
Crea un script `repositorio_usuario_pdo.php` que incluya el fichero `connection_pdo.php` y realiza las siguientes tareas:

**A)** Declara una función llamada ``obtenerUsuarios()`` que devuelva un array con todos los usuarios que pertenezcan al id
de la empresa pasada como argumento ``$empresaId``

~~~
    Como podemos observar en el siguiente snippet de código, para transformar el resultado de la query en un array, debemos 
    llamar al método fetchAll(PDO::FETCH_ASSOC).
~~~
```php
<?php
    function obtenerTodosLosUsuarios(int $empresaId) : array 
    {
       $conexion = crearConexion();
       $sql = "SELECT * FROM User WHERE idEnterprise = $empresaId";
       $listadoEmpresas = $conexion->query($sql)->fetchAll(PDO::FETCH_ASSOC);
       return $listadoEmpresas;
    }
```

**B)**  Crea una funcion llamada `buscarUsuario` que reciba como parámetro el id del usuario a buscar y devuelva un array
 con toda la información del usuario. Si no se encuentra la empresa devolvera un array vacio

```php
<?php
    function buscarUsuario(int $id) : array 
    {
       $conexion = crearConexion();
       $sql = "SELECT * FROM User WHERE id = $id";
       $usuario = $conexion->query($sql)->fetchAll(PDO::FETCH_ASSOC);
       return ($usuario) ? $usuario[0] : array();
    }
````

**C)** Crea una funcion llamada `modificarUsuario` que reciba como parámetro un array con los datos del usuario a modificar.
 Devolverá `true/false` en función de si la acción se ha llevado a cabo correctamente o no.

Los campos modificables son: `firstName, lastName, email, active, phoneNumber, locale, birthday, idEnterprise, password`

```php
<?php
    function modificarUsuario(array $usuario) : bool 
    {
        $conexion = crearConexion();
        $sql = "UPDATE User SET 
                        firstName = '{$usuario['firstName']}',
                        lastName = '{$usuario['lastName']}',
                        email = '{$usuario['email']}',
                        phoneNumber = '{$usuario['phoneNumber']}',
                        active = '{$usuario['active']}',
                        locale = '{$usuario['locale']}',
                        birthday = '{$usuario['birthday']}',
                        idEnterprise = {$usuario['idEnterprise']},
                        active = {$usuario['active']}
                        WHERE id = {$usuario['id']}";
        
        $numAffectedRows = $conexion->exec($sql);
        
        if($conexion->errorCode() == "00000" || $numAffectedRows > 0 ) {
            return true;
        } else {
            print_r($conexion->errorInfo());
            return false;
        }
    }
````

**D)** Crea una funcion llamada `borrarUsuario` que reciba como parámetro el id del usuario a borrar y devuelva `true/false`
en función de si la acción se ha llevado a cabo correctamente o no.

```php
<?php
    function borrarUsuario(int $id) : bool 
    {
        $conexion = crearConexion();
        $sql = "DELETE FROM User WHERE id = $id";     
        $numAffectedRows = $conexion->exec($sql);
   
        if ($conexion->errorCode() == "00000" || $numAffectedRows > 0) {
            return true;
        } else {
            print_r($conexion->errorInfo());
            return false;
        }
    }
````

**E)** Crea una funcion llamada `insertarUsuario` que reciba como parámetro un array con la información del usuario y devuelva
el nuevo usuario insertado.

Los campos requeridos son: `firstName, lastName, email, active, phoneNumber, locale, birthday, idEnterprise, password`

```php
<?php
    function insertarUsuario(array $usuario) : array
    {
        $conexion = crearConexion();
        $sql = "INSERT INTO User (firstName, lastName, email, active, phoneNumber, locale, birthday, idEnterprise, password)
                VALUES ('{$usuario['firstName']}', '{$usuario['lastName']}', '{$usuario['email']}', 
                        '{$usuario['active']}', '{$usuario['phoneNumber']}', '{$usuario['locale']}',
                        '{$usuario['birthday']}', {$usuario['idEnterprise']}, '{$usuario['password']}')";
    
        $numAffectedRows = $conexion->exec($sql);
        
        if($numAffectedRows > 0 ) {    
            return buscarUsuario($conexion->lastInsertId());
        } else {
            print_r($conexion->errorInfo());
            return [];
        }
    }
````

**F)** Crea un nuevo fichero `actividad11.php` en el que hagas uso de cada una de las funciones generadas en el apartado
anterior para ello deberas:
- Mostrar todo el listado de usuarios de la empresa con id = 6
- Buscar un usuario y mostrarlo
- Modificar un usuario y mostrarlo tras su modificación.
- Borrar dicho usuario y comprobar que el borrado se ha llevado a cabo correctamente.


## Actividad 12
Crea un script `repositorio_empresas_pdo.php` y repite las mismas acciones del ejercicio anterior, pero en este caso para 
la entidad `Enterprise de la base de datos `crm_db`.