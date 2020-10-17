@AbapCatalog.sqlViewName: 'ZV_LIBROS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Libros en venta'
@Metadata.allowExtensions: true
define view Z_B_LIBROS
  as select from    ztb_libros_7202 as Libros
    inner join      ztb_catego_7202 as Catego on Libros.bi_categ = Catego.bi_categ
    left outer join Z_B_CLNTS_LIB   as Ventas on Libros.id_libro = Ventas.id_libro
  association [0..*] to Z_B_CLIENTES as _Clientes on $projection.Identificador = _Clientes.id_libro
{
  key Libros.id_libro as Identificador,
  key Libros.bi_categ as Categoria,
      titulo          as Titulo,
      autor           as Autor,
      editorial       as Editorial,
      idioma          as Idioma,
      paginas         as Paginas,
      @Semantics.amount.currencyCode : 'moneda'
      precio          as Precio,
      @Semantics.currencyCode: true
      moneda          as Moneda,
      case
        when Ventas.Ventas < 1 then 0
        when Ventas.Ventas = 1 then 1
        when Ventas.Ventas > 1 and Ventas.Ventas < 3 then 2
        when Ventas.Ventas >= 3 then 3
        else 0
      end             as Exito,
      ''              as UIExito,
      formato         as Formato,
      url             as Url,
      _Clientes       as Clientes
}
