@AbapCatalog.sqlViewName: 'ZV_COMPRAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Libros comprados por clientes'
@Metadata.allowExtensions: true
define view Z_B_CLNTS_LIB
  as select from ztb_clnts_lib_02
{
      //ztb_clnts_lib_02
  key id_libro,
      count(distinct id_cliente) as Ventas
}
group by
  id_libro
