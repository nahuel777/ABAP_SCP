CLASS zcl_books_load_data_7202 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_books_load_data_7202 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lt_acc_categ  TYPE TABLE OF ztb_acc_categ_02,
          lt_categ      TYPE TABLE OF ztb_catego_7202,
          lt_clientes   TYPE TABLE OF ztb_clientes_202,
          lt_libros_alq TYPE TABLE OF ztb_clnts_lib_02,
          lt_libros     TYPE TABLE OF ztb_libros_7202.

** Categoria con tipos de acceso**
    lt_acc_categ = VALUE #( ( bi_categ = 'H'  tipo_acceso = '2' )
                            ( bi_categ = 'C'  tipo_acceso = '2' )
                            ( bi_categ = 'A'  tipo_acceso = '2' )
                            ( bi_categ = 'F'  tipo_acceso = '1' )
                            ( bi_categ = 'X'  tipo_acceso = '3' )
                          ).

    DELETE FROM ztb_acc_categ_02.
    INSERT ztb_acc_categ_02 FROM TABLE @lt_acc_categ.
    SELECT * FROM ztb_acc_categ_02 INTO TABLE @lt_acc_categ.

    out->write( sy-dbcnt ).
    out->write( 'ztb_acc_categ_02 data inserted successfully!').

** Descripcion de categorias y tipo de acceso **
    lt_categ = VALUE #( ( bi_categ = 'S'  descripcion = 'Ficcion (jovenes mayores de 12)' )
                        ( bi_categ = 'E'  descripcion = 'Academicos (jovenes mayores de 12)' )
                        ( bi_categ = 'A'  descripcion = 'Autoayuda (jovenes mayores de 12)' )
                        ( bi_categ = 'F'  descripcion = 'Fantasia (niños y todo publico)' )
                        ( bi_categ = 'X'  descripcion = 'Erotico (adultos mayores de 18)' )
                       ).

    DELETE FROM ztb_catego_7202.
    INSERT ztb_catego_7202 FROM TABLE @lt_categ.
    SELECT * FROM ztb_catego_7202 INTO TABLE @lt_categ.

    out->write( sy-dbcnt ).
    out->write( 'ztb_catego_7202 data inserted successfully!').


** Clientes **
    lt_clientes = VALUE #( ( id_cliente = '100000000004035'  tipo_acceso = '2' nombres = 'Nahuel Federico' apellidos = 'Herradon' email = 'nahuel.herradon@gmail.com' url = 'https://www.linkedin.com/in/nahuel-herradon/')
                           ( id_cliente = '100000000004036'  tipo_acceso = '2' nombres = 'Ash' apellidos = 'Williams' email = 'ftaghn@fakedomain.com' url =
'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/H._P._Lovecraft%2C_June_1934.jpg/250px-H._P._Lovecraft%2C_June_1934.jpg')
                           ( id_cliente = '100000000004037'  tipo_acceso = '3' nombres = 'Janis' apellidos = 'Joplin' email = 'ohbaby@fakedomain.com' url =
'https://www.reporteindigo.com/wp-content/uploads/2020/10/Cine_105250714_1682857_1706x960.jpg')
                           ( id_cliente = '100000000004038'  tipo_acceso = '1' nombres = 'Maxwell' apellidos = 'Smart' email = 'super86@fakedomain.com' url = 'https://clarkstonnews.com/wp-content/uploads/2017/10/watchphoneGetSmart-1024x813.jpg')
                           ( id_cliente = '100000000004039'  tipo_acceso = '3' nombres = 'Mario' apellidos = 'Santos' email = 'elderecholampone@fakedomain.com' url =
'https://scontent.faep9-1.fna.fbcdn.net/v/t1.0-9/17264967_281502512273934_4849297714089193804_n.png?_nc_cat=103&_nc_sid=09cbfe&_nc_ohc=m7f8G028w20AX8rDXyv&_nc_ht=scontent.faep9-1.fna&oh=82d3ed2a77837833a5e65fd936c487e2&oe=5FA0F9D2')
                           ( id_cliente = '100000000004040'  tipo_acceso = '3' nombres = 'Emilio' apellidos = 'Ravena' email = 'cosseti@fakedomain.com' url = 'https://pbs.twimg.com/media/EIOSW2TWkAUQAQ-?format=jpg&name=small')
                         ).

    DELETE FROM ztb_clientes_202.
    INSERT ztb_clientes_202 FROM TABLE @lt_clientes.
    SELECT * FROM ztb_clientes_202 INTO TABLE @lt_clientes.

    out->write( sy-dbcnt ).
    out->write( 'ztb_clientes_202 data inserted successfully!').


** Libros alquilados **
    lt_libros_alq = VALUE #( ( id_cliente = '100000000004035'  id_libro = '800000850' )
                             ( id_cliente = '100000000004035'  id_libro = '800000857' )
                             ( id_cliente = '100000000004035'  id_libro = '800000852' )
                             ( id_cliente = '100000000004035'  id_libro = '800000855' )
                             ( id_cliente = '100000000004036'  id_libro = '800000852' )
                             ( id_cliente = '100000000004037'  id_libro = '800000855' )
                             ( id_cliente = '100000000004037'  id_libro = '800000856' )
                             ( id_cliente = '100000000004038'  id_libro = '800000851' )
                             ( id_cliente = '100000000004039'  id_libro = '800000858' )
                             ( id_cliente = '100000000004039'  id_libro = '800000855' )
                             ( id_cliente = '100000000004039'  id_libro = '800000856' )
                             ( id_cliente = '100000000004040'  id_libro = '800000853' )
                             ( id_cliente = '100000000004040'  id_libro = '800000854' )
                       ).

    DELETE FROM ztb_clnts_lib_02.
    INSERT ztb_clnts_lib_02 FROM TABLE @lt_libros_alq.
    SELECT * FROM ztb_clnts_lib_02 INTO TABLE @lt_libros_alq.

    out->write( sy-dbcnt ).
    out->write( 'ztb_clnts_lib_02 data inserted successfully!').

** Libros **
    lt_libros = VALUE #(
                         ( id_libro = '800000850' bi_categ = 'E'  titulo = 'El Calculo' autor = 'Louis Leithold' editorial = 'Oxford' idioma = 'S' paginas = '1360' precio = '50' moneda = 'eur' formato = 'B' url = '' )
                         ( id_libro = '800000851' bi_categ = 'F'  titulo = 'El señor de los anillos' autor = 'JR Tolkien' editorial = 'Atlantida' idioma = 'S' paginas = '900' precio = '15' moneda = 'eur' formato = 'B' url = '' )
                         ( id_libro = '800000852' bi_categ = 'F'  titulo = 'La llamada del Cthulhu' autor = 'HP Lovecraft' editorial = 'Weird Tales' idioma = 'S' paginas = '234' precio = '' moneda = '' formato = '' url = '' )
                         ( id_libro = '800000853' bi_categ = 'X'  titulo = 'Fifty shades of gray' autor = 'E. L. James' editorial = 'Vintage Books' idioma = 'E' paginas = '560' precio = '' moneda = '' formato = '' url = '' )
                         ( id_libro = '800000854' bi_categ = 'A'  titulo = 'Agilmente' autor = 'Estanislao Bachrach' editorial = 'Sudamericana' idioma = 'S' paginas = '330' precio = '' moneda = '' formato = '' url = '' )
                         ( id_libro = '800000855' bi_categ = 'S'  titulo = 'One flew over the cuckoos nest' autor = 'Ken Kensey' editorial = 'Anagrama' idioma = 'E' paginas = '450' precio = '' moneda = '' formato = '' url = '' )
                         ( id_libro = '800000856' bi_categ = 'S'  titulo = 'El señor de las moscas' autor = 'William Golding' editorial = 'Alianza' idioma = 'S' paginas = '400' precio = '' moneda = '' formato = '' url = '' )
                         ( id_libro = '800000857' bi_categ = 'E'  titulo = 'C Programming Language' autor = 'Brian Kernighan' editorial = 'Prentice Hall Software' idioma = 'E' paginas = '288' precio = '40' moneda = 'EUR' formato = '' url = '' )
                         ( id_libro = '800000858' bi_categ = 'S'  titulo = 'El libro de los cinco anillos' autor = 'Miyamoto Musashi' editorial = 'Ediciones Obelisco' idioma = 'S' paginas = '500' precio = '' moneda = '' formato = '' url = '' )
                       ).

    DELETE FROM ztb_libros_7202.
    INSERT ztb_libros_7202 FROM TABLE @lt_libros.
    SELECT * FROM ztb_libros_7202 INTO TABLE @lt_libros.

    out->write( sy-dbcnt ).
    out->write( 'ztb_libros_7202 data inserted successfully!').


  ENDMETHOD.

ENDCLASS.
