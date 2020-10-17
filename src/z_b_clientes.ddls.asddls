@AbapCatalog.sqlViewName: 'ZV_CLIENTES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Detalles de clientes'
@Metadata.allowExtensions: true
define view Z_B_CLIENTES
  as select from ztb_clientes_202 as Clientes
    inner join   ztb_clnts_lib_02 as Compras on Compras.id_cliente = Clientes.id_cliente
{
  key id_libro,
  key Clientes.id_cliente,
  key tipo_acceso,
      concat_with_space(nombres, apellidos, 1) as Nombre,
      email,
      url
}
